# Guide d’utilisation du script `vm.py`

**Auteurs :** SIMAO Julien et BREANT Hugo
**Date :** 11/09/2025

---

## Résumé
Ce document explique comment nous avons travailler. 
Il présente les fonctionnalités disponibles, ainsi que les problèmes rencontrés lors du développement. 
Ce guide servira de référence pour comprendre l’usage du programme et les améliorations possibles. 

---

## (Nom a redéfinir)

Nous avons tout dabor commencer par installer nos machine virtuelle sur nos machine personnelle, nous avons ensuite creé nos deux projets sur GitHub pour pouvoir par la suite reconnecter nos deux programme.
nous avons ensuite lu le sujet pour pourvoir ensuite réfléchire comment s'organiser, c'est a dire qui fait quoi, qui code quoi.
Puis nous avons installer les différente extension de logiciel comme git.


## (Nom a redéfinir)

Nous avons ensuite commencer chaquun de notre coté commancer a cherche des commande qui pouvait nous aider pour la réalisation de notre projet et nous les avons ensuite tester pour comprendre commant elles fonctionner, ce qu'elle fesait  et quelle argument sont a donner.
Aprés avoir plus ou moins comprit les commande nous avons commancer par faire l'étape 1 qui consiter a crée une machine virtuel debian 64bits, avce des condition particulière.
Lors de cette étape nous avons rencontre un problème qui bloquer l'ouverture de la machine virtuelle dans nos machien virtuelle, nous avons réutie a réger le problème en cochant un élément dans notre ligicielle de vitualisation sur nos machine réel. Nous avons dû aussi autoriser la virtualisation imbriquée sur nos ordinateur personnel. Suite a cela nous avons piu vérifier que nos programmes crée bien une machinne viruelle que nous pouvons ouvrire.


## (Nom a redéfinir)

Nous avons ensuite continuer nos programes en rajoutant la vérification de l'éxistance d'une machine qui exite déja et ci c'est la cas supprimer l'auciéne machine virtuelle comme demander dans l'étape 2.
Nous avons ensuite passer a l'étape 4 qui conste a donner un argument permet de crée, supprimer, démarrer, arréter ou afficher les machinne virtuelle existante.
Pour réponde a l'étape nous avons décider d'utiliser 'goto' plutot que ce que nous avons vue en cours avec les 'if' et 'fi' car nous avons l'impresion que 'goto' est plus adapter a la demande.
Durant nos multiple tets sur l'étape 4 nous avons du crée plusieur machine virtuelle ce qui nous a donner l'idée de creé une nouvelle argument que ce qui nous a été demander, nous avons décider de rajouter l'argument T qui permet de suprimer toutes les machine virtuelle que nous avons crée. Nous avons ensuite modifier notre code pour réaliser les étape suivantes.
