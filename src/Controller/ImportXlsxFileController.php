<?php

namespace App\Controller;

use App\Entity\Band;
use App\Repository\BandRepository;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\Serializer\SerializerInterface;

class ImportXlsxFileController extends AbstractController
{
    public function __construct(
        private SerializerInterface $serializer,
        private BandRepository $bandRepository,
        private EntityManagerInterface $em

    ){}

    /**
     * import xlsx data and sent every in messagebus.
     */
    #[Route('/api/bands/import/xlsx', name: "import_xlsx_file", methods: ['POST'])]
    public function __invoke(Request $request): Response
    {
        $file = $request->files->get('file');
        
        if(empty($file)){
            return new JsonResponse(['message' => 'No file is given'], Response::HTTP_BAD_REQUEST);
        } elseif($file->getClientOriginalExtension() !== 'xlsx'){
            return new JsonResponse(['message' => 'file not supported'], Response::HTTP_BAD_REQUEST);
        }
        
        $fileFolder = __DIR__ . '/../../public/uploads/';
        
        try {
            $file->move($fileFolder, $file->getClientOriginalName());
        } catch (FileException $e) {
            dd($e);
        }

        $spreadsheet = IOFactory::load($fileFolder . $file->getClientOriginalName());
        $spreadsheet->getActiveSheet()->removeRow(1);
        $data = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
        $this->persitsData($data);

        $all = $this->serializer->serialize($this->bandRepository->findAll(), 'json');
        return new JsonResponse($all, json: true);
    }

    /**
     * persit the row in bdd.
     * 
     * @param string[] $data
     */
    private function persitsData(array $data){

        foreach($data as $row){
                $band = (new Band())
                ->setName($row['A'])
                ->setOrigin($row['B'])
                ->setCity($row['C'])
                ->setStartDate(empty($row['D']) ? null : new \DateTime($row['D']))
                ->setEndDate(empty($row['E']) ? null : new \DateTime($row['E']))
                ->setFounder($row['F'])
                ->setTotalMember((int) $row['G'])
                ->setGenre($row['H'])
                ->setDescription($row['I'])
            ;
            $this->em->persist($band);
        }
        $this->em->flush();
    }
}