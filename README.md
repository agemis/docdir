# BESOIN

associer des metadonnées sur des répertoires, permettre la recherche



# V1. J'utilise les nom des répertoires pour stocker les metadonnées


# V2. 

Les métadonnées sont dans un fichier "sidecar" (json, yaml, ... a décider) qui se trouve dans ce répoertire?
Ce fichier est importé dans une base sqlite, qui permet une recherche efficace.

Nouveau nom ? FolderTag


## CE QUE JE NE VEUX PAS
Je ne veux pas de vendor locking. Je ne touche pas aux répertoires (mis a part le fichier de metedata)






# IDEAS

docdir is a program that help to classify and retreive folders

There are other programs that already does things like that, using
* tags: TagSpaces
* powerfull search (agent ransack, everything)
* a database: zotero, gcstar (medias), hydrus (images)


# TagSpaces

Ce que j'essaie de faire ressemble beaucoup a tagspace, qui propose d'ailleurs a l'install de choisir de renommer les fichier (ma v1) ou d'utiliser des fichier sidecar (ma v2)

Tagspace ne gere pas les tags dans les nom de répertoire pour les dossiers (justification: le nom deviendrait trop long).
Cf https://tagspaces.uservoice.com/forums/213931-general/suggestions/6134490-add-tag-to-directory-only

Mais il gere les tags dans un répertoire, avec un fichier sidecar
Il crée un répertoire .ts
Dans ce répertoire .ts, il y a un fichier tsm.json qui contient ceci

Exemple pour un dossier sur lequel j'ai mis un tag "high" et un tag "sidecar"

```
{"tags":[{"title":"high","color":"#ff7537","textcolor":"#ffffff","type":"sidecar"},{"title":"4star","color":"#ffcc24","textcolor":"#ffffff","type":"sidecar"}],"id":"1c5ba0f0-1649-4b9c-b96a-979349f66081","appName":"TagSpaces","appVersion":"5.1.3","lastUpdated":"2022-12-31T13:44:36.357Z"}
```




# V1


## docdir
names for documentation directories



## naming convention



## conventions de nommage des répertoires pour mes documentations. 

Mes documentations, ce sont des contenu qu'en général je ne produit pas (sion ce sont des rpjets), et qui changent peu. Ca peut être des livres, des videos, ...

L'objectif de cette convention est d'embarquer des métadonnées dans les noms de répertoire, de facon normalisée, mais souple.

Pourquoi ? 
- pour pouvoir archiver ce contenu, par année, sans avoir a créer un répertoire par année.
- pour pouvoir rechercher dans ce contenu

Comment: 
Dans un premier temps en faisant un petit script qui s'assure que la convention est respectée. 
Dans un second temps en construisant une "base de données" de ces répertoires, qui pourra servir a chercher, et a faire des modification (en masse si nécessaire)


## La convention de nommage

nom du répertoire: auteur_anneeproduction_path_categorie_titre_note_tag_metatag_anneestockage_id

exemple: gail-show_2018_logiciel-sqlserver_videocourse_sql-server-distributed-replay_+++__2022_04016776-3723-4402-a2bf-9dd3d00893d2

auteur: gail-show
anneeproduction: 2018
path: logiciel-sqlserver
categorie: videocourse
titre: sql-server-distributed-replay
note: +++
tag: 
metatag: 
anneestockage: 2022
id: 04016776-3723-4402-a2bf-9dd3d00893d2






Le nom du répertoire est en minuscule, sans accents ni caractères exotiques

On a 10 champs: auteur, anneeproduction, path, categorie, titre, note, tag, metatag, anneestockage, id
Ces 10 champs sont séparés par des _. Un champ ne peut donc pas contenir de _, mais il peut contenir -


### champ auteur

L'auteur du contenu du répertoire: "" si inconnu ou non renseigné

### anneeproduction

L'année de production du contenu du répertoire, sur 4 chiffres, "" si inconnu on non renseigné

### path (premier niveau obligatoire)

tag de la forme path1-path2-pathn pour créer un arborescence. 
Ca permet si je le désire un jour, de ranger les fichiers a plat tout en conservant une "arborescence de rangement"

### champ categorie (obligatoire)

La categorie du répertoire, par exemple "book", "video", "course"
Un seul mot, pas d'espace, pas de -


### champ titre

Le "nom" usuel qu'on aurait donnée au répertoire, pas d'espace, par de _, peut contenir -

### champ note

Valeur de "" a +++++, vide si inconnu ou non renseigné

### champs tag

Le champs tag est en faire une suite de tags, séparés par -
Les valeurs des tags ne peuvent contenir que des chiffres ou des lettres. Un tag est un seul mot, sans espace

exemple de valeurs possibles, pour de la doc sql server par exemple
-year
-cloud
-tool
-querytuning   (tout ce qui est relié aux performances)
-internals
-bestpractises
-certification
-development



### champ metatag

Ce champ est special, c'est une suite de clefs/valeurs, séparés par -. Exemple: nom1-monnom1-nom2-monnom2
Ca me permettra de combler des besoins supplémentaire sans faire évoluer la structure

### annestockage (obligatoire)

Pour l'archivage, le tag year contient l'année ou j'ai ajouté ce répertoire (ou bien la dernière année au je l'ai modifié, en cas de modification après création)
Ca me permet d'archiver sur le cloud, par années
obligatoire, sur 4 chiffres.


### id (obligatoire, automatique)

Un id, sous la forme d'un guid
Cet id ne change jamais, ce sera la clef primaire dans la bdd.



