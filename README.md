# Atelier 3 : Smart Contract "Mini Réseau Social" en Solidity

Ce dépôt contient le travail pratique de l'Atelier 3, qui consiste à développer, déployer et tester un smart contract Solidity simulant un mini réseau social décentralisé.

## 🛠️ Outils et Technologies Utilisés
- **Remix IDE** : Environnement de développement en ligne pour écrire, compiler et tester le smart contract.
- **MetaMask** : Portefeuille numérique pour la gestion des comptes et la validation des transactions.
- **Remix VM** : Environnement de test local simulé pour le déploiement rapide.

---

## 💻 1. Code Source du Smart Contract (`MiniSocial.sol`)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MiniSocial {
    // Structure qui représente un post
    struct Post {
        string message;
        address author;
    }

    // Tableau dynamique pour stocker les posts
    Post[] public posts;

    // Fonction pour publier un message
    function publishPost(string memory _message) public {
        posts.push(Post({
            message: _message,
            author: msg.sender
        }));
    }

    // Fonction pour consulter un post par son index
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Post inexistant");
        return (posts[index].message, posts[index].author);
    }

    // Fonction pour récupérer le nombre total de posts
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
