<?php

namespace App\Handler;

use App\Entity\Band;
use App\Message\XlsxRowMessage;
use App\Repository\BandRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Messenger\Attribute\AsMessageHandler;
use Symfony\Component\Serializer\SerializerInterface;

#[AsMessageHandler()]
class XlsxRowHandler
{
    public function __construct(
        private EntityManagerInterface $em,
        private BandRepository $bandRepository,
        private SerializerInterface $serializer,
    )
    {
        
    }

    /**
     * persit the row in bdd.
     */
    public function __invoke(XlsxRowMessage $message)
    {
        $row = $message->getContent();

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
        $this->em->flush();
    }
}