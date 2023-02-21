---
layout: page
element: lecture
subtitle: 'Pushing to a remote repository with `git`'
language: Bash
---

- To "push" means to **upload and incorporate** changes from a local repository to a remote copy of a repository.
- To do this, we use the command `git push`
- The command `git push` can only be run successfully after we have added (with `git add`) and committed (with `git commit`) the changes that we want to upload.
  - If you do not add and commit changes to at least one file, you will see an error like the following:
  ```
  error: src refspec main does not match any
  ```
  - To fix this error, run `git add NAME-OF-FILE-YOU-WANT-TO-TRACK`, then rin `git commit -m "A MEANINGFUL COMMIT MESSSAGE!"`
- Note that you can only push to remote repositories that you have been given access to collaborate with!
  - For the following activity, make sure that you have accepted the invitation that GitHub sent to you registration email.

- **In-class activity 2**: Markdown and Pushing changes to a collaborative repo
  1. Display the contents of the README.md file from the local copy of the markdown-cheatsheet repo that you cloned on the previous activity. You can use the commands `nano`, `cat` or `less`
  1. What is the difference between the file that you see on your terminal and the [file as it is displayed on GitHub](https://github.com/LunaSare/markdown-cheatsheet#readme)?
  1. Create a .txt file named `"Your-Name-markdown-commands.txt"`. Write down the differences that you note from the previous point.
  1. `git add` your file and then `git commit` with a meaningful message.
  1. Make sure that you have accepted the invite to collaborate on the [markdown-cheatsheet](https://github.com/LunaSare/markdown-cheatsheet) repo.
  1. Run the command `git push` to upload the file you added and committed to the remote copy of the repo.
  1. Go to the [home of the repo on GitHub](https://github.com/LunaSare/markdown-cheatsheet) and look at your file there.


<!-- Answer: Text is intermixed with markup instructions or symbols -->
