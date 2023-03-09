# Evaluation finale blockchain

Le contrat intelligent que vous allez créer suit le statut des articles achetés sur une marketplace en ligne. Lorsque le contrat est créé, le statut d'expédition est défini sur Pending. Lorsqu'un article est expédié, le statut d'expédition est défini sur Shipped et un événement est émis. Lors de la livraison, le statut d'expédition de l'article est défini sur Delivered et un autre événement est émis.

## Déploiement

### Configuration requise
 Il est nécessaire de compléter le fichier .env se trouvant à la racine du projet comme suit :

        PASS_PHRASE= VOTRE_PASS_PHRASE
        GOERLI_PROJECT_ID = IDENTIFIANT_APP_GOERLI_ALCHEMY
        MUMBAI_PROJECT_ID = IDENTIFIANT_APP_MUMBAI_ALCHEMY

Le projet peut ensuite etre déployer sur deux blockchains :

- Pour Mumbai : 

        truffle migrate --network matic 

- Pour Goerli : 

        truffle migrate --network goerli 