# Azure Scripts

Migrating from the Legacy platform to Azure is planned to happen over
two phases. Phase 1 is a "lift and shift" - keep (roughly) the current
configuration and just change the underlying infrastructure. Phase 2
is move to some (currently ill defined) container based system.

This repo is all about Phase 1

## Legacy

Current (legacy) system is based on ASP Classic through IIS on 
bare metal Windows 2003 running in a datacenter somewhere.

We've got five machines in total

  * Two live servers (for redundancy)
  * One load balancer (to service the live servers)
  * One stage machine 
  * One 'construction' server (for build and testing)

## Azure

We're going to keep the same structure - live machines that only end users
see behind a load balancer, a stage machine that holds updates ready for live,
and a construction server where new services/content is developed, and some
administration tasks are run.

We're also going to (probably) spin up an SQL server (either MS SQL or Postgres)
so we can start re-writing services with a better backend.

In legacy, content is moved from construction to stage to live through a
proprietary system called "RepliWeb". However, we're not going to be able
to use that in the future, so we'll have to investigate alternatives.

One of the alternatives is to share the content disk between the live servers,
to make sure they're in sync (and to allow us to spin up new live servers real
quick).

We need:

  * A load balancer
  * Two live servers
  * Shared disk for the live servers
  * Stage server
  * Construction server

These are all called "resources" in Azure, and we need at least one "Resource 
Group" to manage them.

## The Scripts

The scripts in this repo should be able to spin up an Azure cluster from
scratch with everything ready to run, just add content.

