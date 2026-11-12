
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MiniSocial {

    // Structure qui represente un post
    struct Post {
        string message;
        address author;
    }

    // Tableau dynamique pour stocker les posts
    Post[] public posts;

    // Fonction pour publier un message
    function publishPost(string memory _message) public {
        Post memory newPost = Post({
            message: _message,
            author: msg.sender
        });

        posts.push(newPost);
    }

    // Fonction pour consulter un post
    function getPost(uint index)
        public
        view
        returns (string memory, address)
    {
        require(index < posts.length, "Post inexistant");

        return (
            posts[index].message,
            posts[index].author
        );
    }

    // Fonction pour recuperer le nombre total de posts
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
