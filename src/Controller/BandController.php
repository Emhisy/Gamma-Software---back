<?php

namespace App\Controller;

use App\Entity\Band;
use App\Repository\BandRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/api/bands')]
class BandController extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $em,
        private SerializerInterface $serializer,
        private BandRepository $bandRepository
    ){}

    #[Route('/', name: 'app_band_index', methods: ['GET'])]
    public function all(): Response
    {
        $all = $this->serializer->serialize($this->bandRepository->findAll(), 'json');
        return new JsonResponse($all, json: true);
    }

    #[Route('', name: 'app_band_new', methods: ['POST'])]
    public function new(Request $request): Response
    {
        $band = $this->serializer->deserialize($request->getContent(), Band::class, 'json');
        $this->em->persist($band);
        $this->em->flush();

        $json =$this->serializer->serialize($band, 'json');

        return new JsonResponse($json, Response::HTTP_CREATED, json: true);
    }

    #[Route('/{id}', name: 'app_band_show', methods: ['GET'])]
    public function show(Band $band): Response
    {
        $jsonBook =$this->serializer->serialize($band, 'json');

        return new JsonResponse($jsonBook, Response::HTTP_CREATED, json: true);
    }

    #[Route('/{id}', name: 'app_band_edit', methods: ['PUT'])]
    public function edit(Request $request, Band $band): Response
    {
        $band = $this->serializer->deserialize($request->getContent(), Band::class, 'json',  [AbstractNormalizer::OBJECT_TO_POPULATE => $band]);
        $this->em->persist($band);
        $this->em->flush();

        $json =$this->serializer->serialize($band, 'json');

        return new JsonResponse($json, Response::HTTP_CREATED, json: true);
    }

    #[Route('/{id}', name: 'app_band_delete', methods: ['DELETE'])]
    public function delete(Band $band): Response
    {
        $this->em->remove($band);
        $this->em->flush();

        return new Response('', Response::HTTP_NO_CONTENT);
    }
}
