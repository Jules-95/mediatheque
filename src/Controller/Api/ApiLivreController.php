<?php

namespace App\Controller\Api;

use App\Repository\LivreRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Livre;
use Doctrine\ORM\EntityManagerInterface;

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
        // TEST POSTMAN OK
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
        // TEST POSTMAN OK
    }

    // Methode POST

    #[Route('', name: 'api_livre_new', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em): JsonResponse
    {
        // Je passe le JSON en tableau PHHP pour pouvoir utiliser $data['...']
    $data = json_decode($request->getContent(), true);

    $livre = new Livre();
    $livre->setTitre($data['titre']);
    $livre->setAuteur($data['auteur']);
    $livre->setIsbn($data['isbn']);
    $livre->setDatePublication(new \DateTimeImmutable($data['datePublication']));
    $livre->setDisponible(true);

    // entity Manager ->Equivalent ici pdo prepare et $stmt execute en php natif
    $em->persist($livre);
    $em->flush();

    return $this->json(['message' => 'Livre ajouté !', 'id' => $livre->getId()], 201);
    // TEST POSMAN OK
}
}




