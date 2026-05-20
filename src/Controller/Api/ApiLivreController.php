<?php

namespace App\Controller\Api;

use App\Repository\LivreRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Livre;

#[Route('/api/livres')]
final class ApiLivreController extends AbstractController
{
    #[Route('', name: 'api_livres_index', methods: ['GET'])]
    public function index(LivreRepository $repo): JsonResponse
    {
        $livres = $repo->findAll();
        
        $data = [];
        foreach ($livres as $livre) {
            $data[] = [
                'id' => $livre->getId(),
                'titre' => $livre->getTitre(),
                'auteur' => $livre->getAuteur(),
                'isbn' => $livre->getIsbn(),
                'disponible' => $livre->isDisponible(),
            ];
        }
        
        return $this->json($data);
    }

    #[Route('/{id}', name: 'api_livre_show', methods: ['GET'])]
    public function show(Livre $livre): JsonResponse
    {
    return $this->json([
        'id' => $livre->getId(),
        'titre' => $livre->getTitre(),
        'auteur' => $livre->getAuteur(),
        'isbn' => $livre->getIsbn(),
        'disponible' => $livre->isDisponible(),
        ]);
    }
}




