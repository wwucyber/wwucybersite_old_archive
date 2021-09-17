---
title: "How to Edit This Site"
date: "2021-09-16"
showthedate: false
draft: false
---

This site is created using the [Hugo](https://gohugo.io/) static site generator.  Hugo accepts Markdown and translates 
it into HTML/CSS/JS based on the provided theme.  This site uses the 
[terminal](https://github.com/panr/hugo-theme-terminal) theme.
 Terminal has some theme-specific features, which are detailed in the previous link.
 
## How to build this site:  
 
Firstly, make sure that you're using a recent version of Hugo.  The version shipped in Debian stable is too old for our 
purposes.  The author is using v0.55.3. You can check your version with the following command:  

```bash
hugo version
```

Hugo can be installed on OS X-  [See Here](https://gohugo.io/getting-started/installing/#macos).  

 Now that we have Hugo installed, start by cloning the source repository:  
 ```bash
 git clone --recursive https://github.com/wwucyber/wwucybersite.git
 ```
 
 Notice that there is a git submodule, called `public` locally, within the repo. This submodule is our build repository,
  which is the Github repo that holds our actual HTML/CSS for the live site. There should be no reason to ever push to 
  the build repo directly- it should only be changed by running our deploy script. The only time you'd need to push directly 
  to the build repo is if you need to remove a post.  Ideally, this will never take place.
  
Make sure that your submodule is on the correct branch by running the following:  

```bash
cd public && git checkout master && cd ..
```  
  
Now, let's assume we've made some changes to the site.  To deploy, simply run the included script:  
 ```bash
 ./deploy.sh "Your commit message here"
```

The deploy script will twice prompt for your Github username and password.  This is because it's pushing to two different 
repos: the source repo, and the build repo. Once it's done, your changes should be visible on the website (this website!) 
within seconds.

## An Introduction to Markdown and Hugo:

This section will walk you through how to make a blog post for our site.  

The initial creation of a Hugo site has already been handled, so there's no need to worry about it. If you want to learn 
how to create your own Hugo site, check out their [Getting Started Guide](https://gohugo.io/getting-started/quick-start/).  

#### Create a new post

Be sure that you're currently located in the root directory of the repo.  Then, run this command:

```bash
hugo new "posts/Your Post Title.md"
```

Use your favorite editor or IDE to open up this file.  It's located at `content/posts/Your Post Title.md`.

The first thing you'll need to do is set `draft: false`.  

Next, you'll have to craft your post using Markdown.  There are quite a few good resources online to help you learn, if 
needed.  Check out the [Markdown tutorial](https://www.markdowntutorial.com/), and consult a 
[Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).  You can also check out other 
posts, like this one, to see how they're written.  

#### Add an image
To add an image, you'll need to add them to the directory `/themes/terminal/static/img`. For best practice, you should 
create a sub-directory for each post, in which to store your images. To refer to these images in 
a post, refer to the img directory at the root directory, for example, `/img/introduction/nyancat.gif`. Here's an example:

{{< image src="/img/introduction/nyancat.gif" alt="Nyan Cat" position="center" >}}

Note that this format is unique to the Terminal theme. If using a different theme, you may end up using raw HTML.  

That's another thing to keep in mind while writing Markdown- it will accept any valid HTML without issue.  Here's an 
<b>example</b>.

#### Add a code block

Here's an example of C code from the Linux kernel:

```c
void nmi_panic(struct pt_regs *regs, const char *msg)
{
        int old_cpu, cpu;

        cpu = raw_smp_processor_id();
        old_cpu = atomic_cmpxchg(&panic_cpu, PANIC_CPU_INVALID, cpu);

        if (old_cpu == PANIC_CPU_INVALID)
                panic("%s", msg);
        else if (old_cpu != cpu)
                nmi_panic_self_stop(regs);
}
```

#### View your post

Before pushing changes, you can use Hugo to generate and view your post.  To do so, run the following:

```bash
hugo server
```

Use your browser to navigate to `http://localhost:1313` to see the site.  This server will live-reload as you make 
changes to your post.  You can use this as you write your post to make sure that everything is generated the way 
you're intending. 

#### Push your changes

Now that we've finished and verified our post, we can push the changes to the live site.  Use the `deploy.sh` script 
mentioned earlier, and make sure to pass it a useful commit message.  

Congratulations! We're all done, and the site has been improved thanks to your post.
