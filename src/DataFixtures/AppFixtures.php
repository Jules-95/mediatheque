<?php

namespace App\DataFixtures;

use App\Entity\Abonne;
use App\Entity\Emprunt;
use App\Entity\Livre;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;


class AppFixtures extends Fixture
{
    //Ajout du constructeur pour utiliser UserPasswordHAsher
    public function __construct(private UserPasswordHasherInterface $hasher) {}


    public function load(ObjectManager $manager): void
    {

        // Admin
        $admin = new User();
        $admin->setEmail('admin@mediatheque.fr');
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setPassword($this->hasher->hashPassword($admin, 'admin123'));
        $manager->persist($admin);

        // Bibliothécaire
        $biblio = new User();
        $biblio->setEmail('biblio@mediatheque.fr');
        $biblio->setRoles(['ROLE_BIBLIOTHECAIRE']);
        $biblio->setPassword($this->hasher->hashPassword($biblio, 'biblio123'));
        $manager->persist($biblio);

        // 10 livres (Générés par ia)
        $livresData = [
            ['titre' => 'Harry Potter', 'auteur' => 'J.K. Rowling', 'isbn' => '9782070584628'],
            ['titre' => 'Le Seigneur des Anneaux', 'auteur' => 'Tolkien', 'isbn' => '9782267011258'],
            ['titre' => 'Les Misérables', 'auteur' => 'Victor Hugo', 'isbn' => '9782253096344'],
            ['titre' => 'Le Petit Prince', 'auteur' => 'Saint-Exupéry', 'isbn' => '9782070408504'],
            ['titre' => 'Dune', 'auteur' => 'Frank Herbert', 'isbn' => '9782266320643'],
            ['titre' => '1984', 'auteur' => 'George Orwell', 'isbn' => '9782072763786'],
            ['titre' => 'Le Rouge et le Noir', 'auteur' => 'Stendhal', 'isbn' => '9782253004226'],
            ['titre' => 'Germinal', 'auteur' => 'Émile Zola', 'isbn' => '9782253004226'],
            ['titre' => 'L\'Étranger', 'auteur' => 'Albert Camus', 'isbn' => '9782070360024'],
            ['titre' => 'Madame Bovary', 'auteur' => 'Gustave Flaubert', 'isbn' => '9782253004392'],
        ];

        $livres = [];
        foreach ($livresData as $data) {
            $livre = new Livre();
            $livre->setTitre($data['titre']);
            $livre->setAuteur($data['auteur']);
            $livre->setIsbn($data['isbn']);
            $livre->setDatePublication(new \DateTimeImmutable('2000-01-01'));
            $livre->setDisponible(true);
            $manager->persist($livre);
            $livres[] = $livre;
        }

        // 5 abonnés (Générés par ia)
        $abonnesData = [
            ['nom' => 'Dupont', 'prenom' => 'Jean', 'email' => 'jean.dupont@mail.com'],
            ['nom' => 'Martin', 'prenom' => 'Marie', 'email' => 'marie.martin@mail.com'],
            ['nom' => 'Bernard', 'prenom' => 'Paul', 'email' => 'paul.bernard@mail.com'],
            ['nom' => 'Durand', 'prenom' => 'Sophie', 'email' => 'sophie.durand@mail.com'],
            ['nom' => 'Leroy', 'prenom' => 'Lucas', 'email' => 'lucas.leroy@mail.com'],
        ];

        $abonnes = [];
        foreach ($abonnesData as $data) {
            $abonne = new Abonne();
            $abonne->setNom($data['nom']);
            $abonne->setPrenom($data['prenom']);
            $abonne->setEmail($data['email']);
            $abonne->setDateInscription(new \DateTimeImmutable());
            $manager->persist($abonne);
            $abonnes[] = $abonne;
        }

        // 3 emprunts en cours
        $empruntsData = [
            ['livre' => 0, 'abonne' => 0],
            ['livre' => 1, 'abonne' => 1],
            ['livre' => 2, 'abonne' => 2],
        ];

        foreach ($empruntsData as $data) {
            $emprunt = new Emprunt();
            $emprunt->setLivre($livres[$data['livre']]);
            $emprunt->setAbonne($abonnes[$data['abonne']]);
            $emprunt->setDateEmprunt(new \DateTimeImmutable());
            $emprunt->setDateRetourPrevue(new \DateTimeImmutable('+1 month'));
            $livres[$data['livre']]->setDisponible(false);
            $manager->persist($emprunt);
        }

        $manager->flush();
    }
}
