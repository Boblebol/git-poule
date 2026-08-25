# Contributing to git-poule 🐔

Merci de vous intéresser à **git-poule** ! Les contributions sont les bienvenues, qu'il s'agisse d'améliorations de code, de nouveaux sons aviaires, de corrections de bugs ou de documentation.

---

## 🛠️ Workflow de développement

1. **Forkez** le dépôt et créez votre branche de fonctionnalité :
   ```sh
   git checkout -b feat/ma-super-amelioration
   ```
2. **Exécutez les tests** localement avant de commiter :
   ```sh
   bash test/git-poule-test.sh && bash test/install-test.sh && bash test/site-test.sh
   ```
3. **Respectez les Conventional Commits** (`feat:`, `fix:`, `docs:`, `test:`, `chore:`, etc.).
4. Ouvrez une **Pull Request** claire et détaillée.

---

## 🧪 Lancer la suite de tests

Le projet inclut des tests unitaires et d'intégration en Bash pour valider :
- Le bon wrapping de `git-poule` et `git-picore` (code de retour, arguments, exécution réelle) ;
- Le script d'installation `install.sh` ;
- La conformité de la landing page statique.

```sh
bash test/git-poule-test.sh
bash test/install-test.sh
bash test/site-test.sh
```

---

## 📜 Code de Conduite

Ce projet adhère au Code de Conduite Contributor Covenant (voir [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)). En participant, vous vous engagez à respecter ses principes d'inclusion et de bienveillance.
