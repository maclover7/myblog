---
layout: post
title:  "Deploy Fast with Flynn"
date:   2015-10-04 12:00:00
categories: deployments flynn
---

This is a five step blog post about how to deploy quickly to a VPS using
an awesome Go-powered PaaS (Platform as a Service). Deploy fast with Flynn -- zoom zoom!

# Part 0: Get a VPS (Virtual Private Server)

Before you can do anything with this tutorial, it is vital that you have
a clean VPS that you will install Flynn onto. Without a VPS, there is
nothing to be Flynn-ing (yes, I just turned Flynn into a verb) onto. My
preference is to get a VPS via DigitalOcean (this isn't an endorsement -
I just like their cheap prices + good support). Once you have your VPS
ready to go, ssh into the server, and proceed to the next step.

# Part 1: Install Flynn onto your VPS

Welcome to part 1! In this part, we'll be installing the Flynn PaaS onto
your VPS. Make sure you are SSH'd into the server already, and set to
go.

1. Run the following command to install the Flynn CLI (command line
   interface). This lets Flynn + you chat about all of the cool websites
you'll be building! This command may take a few minutes to run, so don't
be worried if it's taking a little while.

<script src="https://gist.github.com/maclover7/094ee48c027bdd288497.js"></script>

2. Run the following command to get the discovery URL for your one-node
   cluster. If you want to have multiple nodes of Flynn, please see
[their documentation](https://flynn.io/docs/installation#ubuntu-14.04-amd64) or tweet at me (@applerebel) for more information.

<script src="https://gist.github.com/maclover7/0f0b067eda9c00e8b33c.js"></script>

3. Run the following two commands to get your one-node cluster going.
   Make sure the second command returns the correct response!

<script src="https://gist.github.com/maclover7/53e6c3eea0a46081875a.js"></script>

4. Set up your cluster via the next command. Make sure to replace the
   CLUSTER_DOMAIN value with whatever the domain will be for your web
server. If you don't have a domain yet, you can use the following
formula to get a domain name: site.IP_ADDRESS.xip.io. An example of this
would be 10.0.0.1.xip.io. Also, make sure you repalce the --discovery
URL with the URL that was generated earlier.

<script src="https://gist.github.com/maclover7/460a59ac08198b98d9e1.js"></script>

* If it's saying it can't find the cluster, then you should powercycle
flynn-host like so:

<script src="https://gist.github.com/maclover7/a6b4982e3bfccfb845ac.js"></script>

* The above command should say "Flynn bootstrapping complete." if
  everything finished successfully. It should return a command to run
that will look something like this:

<script src="https://gist.github.com/maclover7/d9113bacf0a1b1ab5a8b.js"></script>

this means it's time to install the local Flynn client now on our dev
machine! Also, make sure you take note of the dashboard URL and login
token listed below. We'll be needing this URL and password for Part 3.

# Part 2: Install the Flynn CLI onto your Dev Machine

The hard part is now over -- the installing of Flynn onto the VPS. Next
is the easy part --> installing the Flynn CLI locally onto your
development machine.

1. To install the CLI itself, run the following command:

<script src="https://gist.github.com/maclover7/01d292417fbf901d603e.js"></script>

2. Next, run the command that was returned above from Part 1, that
   begins with 'flynn cluster add ....'. This will associate your local
dev machine with your VPS' Flynn cluster!

The next part is to install your Flynn cluster's SSL certificate onto
your machine, so that way you can securely send your code up to Flynn!

# Part 3: Securing your Flynn Connection

In this part, we'll be installing the Flynn SSL certificate for your
cluster onto your machine. Remember the dashboard URL and token from
Part 1? We'll be needing that now. Scroll up in your terminal logs if
you don't have that information at the ready.

1. Go the URL outputted from the terminal in your web browser. It should start with
   'http://dashboard......'.

2. At the top of the page, there should be a link to install your Flynn VPS' SSL certificate. Download those certificates, double click to open, and choose to "Always trust" the certificate.

3. Close out the window for the certificate, and then select + reopen it
   again in Keychain Access. Open the trust dialog box, and make sure
that "Always trust" is selected. Sometimes the change made earlier
doesn't persist.

That's all for this part, where you secure your Flynn connection! The
last and final part is about creating your Flynn app and pushing it
live!

# Part 5: Push it up, push it up!

Welcome to the final part of the tutorial! In this part, we'll be
creating our Flynn app, adding a git remote, and then pushing it live
for the world to see. Let's get started!

1. 'cd' into any project you have that has a Procfile in it. If you
   don't have one, you can run this in your terminal:

<script src="https://gist.github.com/maclover7/5fa28e36630df3e96afd.js"></script>

2. Next, we're going to create a Flynn app, that will power our website.
   Run the following command below, and substitute APP_NAME with
whatever you'd like to call your app.

`flynn create APP_NAME`

3. The moment of truth! It's finally time to git push up to Flynn. The previous command setup a git remote for us, so now all we have to do is just push up to Flynn, and the rest is handled for us!

<script src="https://gist.github.com/maclover7/041449d7a66abd12eef3.js"></script>

---

That's all there is to it! Thanks for reading through this tutorial on
how to deploy with the Flynn PaaS. You can check out their [website](flynn.io),
[awesome documentation](flynn.io/docs) for more information, or even read Flynn's
[source code on Github](github.com/flynn/flynn).

If you have any questions or anything you'd like to tell me, you can
email me or [tweet](https://twitter.com/applerebel) at me.
