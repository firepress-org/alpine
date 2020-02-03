# [alpine](https://github.com/firepress-org/alpine)

Alpine loaded with many practical tools. Not meant to be a base image.

**It features**:

- it builds **everyday** and on every commits
- it push **four tags** to registry
- it uses **Labels**

<br>

## About alpine

**ABOUT**

[Alpine](https://www.alpinelinux.org/about/) Linux is an independent, non-commercial, general purpose Linux distribution designed for power users who appreciate security, simplicity and resource efficiency.

**SMALL**

Alpine Linux is built around musl libc and busybox. This makes it smaller and more resource efficient than traditional GNU/Linux distributions. A container requires no more than 8 MB and a minimal installation to disk requires around 130 MB of storage. Not only do you get a fully-fledged Linux environment but a large selection of packages from the repository.

Binary packages are thinned out and split, giving you even more control over what you install, which in turn keeps your environment as small and efficient as possible.

**SIMPLE**

Alpine Linux is a very simple distribution that will try to stay out of your way. It uses its own package manager called apk, the OpenRC init system, script driven set-ups and that’s it! This provides you with a simple, crystal-clear Linux environment without all the noise. You can then add on top of that just the packages you need for your project, so whether it’s building a home PVR, or an iSCSI storage controller, a wafer-thin mail server container, or a rock-solid embedded switch, nothing else will get in the way.

**SECURE**

Alpine Linux was designed with security in mind. All userland binaries are compiled as Position Independent Executables (PIE) with stack smashing protection. These proactive security features prevent exploitation of entire classes of zero-day and other vulnerabilities.

<br>

## Regarding Github Actions & CI configuration

![branch_master](https://github.com/firepress-org/alpine/workflows/ci_dockerfile_master/badge.svg?branch=master)

![branch_edge](https://github.com/firepress-org/alpine/workflows/ci_dockerfile_not_master/badge.svg?branch=edge)

[See README-CI.md](./README-CI.md)

<br>

## Docker hub

Always check on docker hub the most recent build:<br>
[https://hub.docker.com/r/devmtl/rclone/tags](https://hub.docker.com/r/devmtl/alpine/tags)

You should use **this tag format** `$VERSION_$DATE_$HASH-COMMIT` in production.

```
devmtl/alpine:3.10_2019-08-31_19H10s38_9e49fa9 
```

These tags are also available to quickly test stuff:

```
devmtl/alpine:3.10
devmtl/alpine:stable
devmtl/alpine:latest
```

<br>


# How to use it

```
IMG_alpine="devmtl/alpine:stable"

docker run --rm -it \
devmtl/alpine:stable sh -c \
'ps aux'

docker run --rm -it \
devmtl/alpine:stable sh -c \
'uname.sh'

docker run --rm -it \
devmtl/alpine:stable sh -c \
'random.sh'

docker run --rm -it \
-v $(pwd)/bin/:/usr/local/bin/ \
devmtl/alpine:stable sh
```

<br>

&nbsp;

<p align="center">
    Brought to you by
</p>

<p align="center">
  <a href="https://firepress.org/">
    <img src="https://user-images.githubusercontent.com/6694151/50166045-2cc53000-02b4-11e9-8f7f-5332089ec331.jpg" width="340px" alt="FirePress" />
  </a>
</p>

<p align="center">
    <a href="https://firepress.org/">FirePress.org</a> |
    <a href="https://play-with-ghost.com/">play-with-ghost</a> |
    <a href="https://github.com/firepress-org/">GitHub</a> |
    <a href="https://twitter.com/askpascalandy">Twitter</a>
    <br /> <br />
</p>

&nbsp;

<br>

## Hosting

At FirePress we empower entrepreneurs and small organizations to create their websites on top of [Ghost](https://firepress.org/en/faq/#what-is-ghost).

At the moment, our **pricing** for hosting one Ghost website is $15 (Canadian dollars). This price will be only available for our first 100 new clients, starting May 1st, 2019 🙌. [See our pricing section](https://firepress.org/en/pricing/) for details.

More details [about this annoucement](https://forum.ghost.org/t/host-your-ghost-website-on-firepress/7092/1) on Ghost's forum.

<br>

## Contributing

The power of communities pull request and forks means that `1 + 1 = 3`. You can help to make this repo a better one! Here is how:

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

Check this post for more details: [Contributing to our Github project](https://pascalandy.com/blog/contributing-to-our-github-project/). Also, by contributing you agree to the [Contributor Code of Conduct on GitHub](https://pascalandy.com/blog/contributor-code-of-conduct-on-github/). It's plain common sense really.

<br>

## License

- This git repo is under the **GNU V3** license. [Find it here](https://github.com/pascalandy/GNU-GENERAL-PUBLIC-LICENSE/blob/master/LICENSE.md).

<br>

## Why all this work?

Our [mission](https://firepress.org/en/our-mission/) is to empower freelancers and small organizations to build an outstanding mobile-first website.

Because we believe your website should speak up in your name, we consider our mission completed once your site has become your impresario.

For more info about the man behind the startup, check out my [now page](https://pascalandy.com/blog/now/). You can also follow me on Twitter [@askpascalandy](https://twitter.com/askpascalandy).

— The FirePress Team 🔥📰