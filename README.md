## dotfiles

This contains config files

Be sure to add a reference to the aliases file in the .zshrc file by adding this to the .zshrc file

<pre><code># Load custom aliases if they exist
[ -f ~/dotfiles/.aliases ] && source ~/dotfiles/.aliases</code></pre>

Once added to .zshrc, you need to source the .zshrc file
<pre><code>source ~/.zshrc</code></pre>
