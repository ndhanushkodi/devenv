#!/bin/bash

if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Don't run me as root"
    exit
fi

clone_if_not_exist() {
  local remote=$1
  local dst_dir="$2"
  echo "Cloning $remote into $dst_dir"
  if [[ ! -d $dst_dir ]]; then
    git clone "$remote" "$dst_dir"
  fi
}

echo "Cloning all of the repos we work on..."

mkdir ~/workspace
mkdir ~/go


echo "Cloning all of the repos we work on..."

# networking-workspace: you might already have this but who knows
clone_if_not_exist "https://github.com/cloudfoundry/networking-workspace.git" "${HOME}/workspace/networking-workspace"

# base16-shell: For the porple
clone_if_not_exist "https://github.com/chriskempson/base16-shell" "${HOME}/.config/base16-shell"

# Bosh Deployment: We usually use this to bump golang in our releases
clone_if_not_exist "https://github.com/cloudfoundry/bosh-deployment" "${HOME}/workspace/bosh-deployment"

# CF Deployment: We use it to deploy Cloud Foundries
clone_if_not_exist "https://github.com/cloudfoundry/cf-deployment" "${HOME}/workspace/cf-deployment"

# CF Deployment Concourse Tasks: We use it to deploy Concourses
clone_if_not_exist "https://github.com/cloudfoundry/cf-deployment-concourse-tasks" "${HOME}/workspace/cf-deployment-concourse-tasks"

# CF Acceptance Tests: 🐱 🐱 or CATS. Happy path integration tests for CF
clone_if_not_exist "https://github.com/cloudfoundry/cf-acceptance-tests" "${GOPATH}/src/code.cloudfoundry.org/cf-acceptance-tests"

# NATS Release: Inherited from Release Integration. We now own this release, which deploys NATS, which is used in CF
clone_if_not_exist "https://github.com/cloudfoundry/nats-release" "${GOPATH}/src/code.cloudfoundry.org/nats-release"

# CF Networking Release: BOSH release for policy-based container networking in Cloud Foundry
clone_if_not_exist "https://github.com/cloudfoundry/cf-networking-release" "${HOME}/workspace/cf-networking-release"

# Routing Release: BOSH Release home to the Gorouter, TCP router, and a bunch of other routing related things. Spelunk! Refactor!
clone_if_not_exist "https://github.com/cloudfoundry/routing-release" "${HOME}/workspace/routing-release"

# Used in routing-release/ci
clone_if_not_exist "https://github.com/cf-routing/doctorroute.git" "${HOME}/workspace/doctorroute"

# Silk release: BOSH Release of the Silk CNI plugin
clone_if_not_exist "https://github.com/cloudfoundry/silk-release" "${HOME}/workspace/silk-release"

# Silk: home to Silk and its components (silk-controller, silk-daemon and silk-cni)
clone_if_not_exist "https://github.com/cloudfoundry/silk" "${HOME}/workspace/silk"

# Route Registrar: broadcasts routes to the gorouter
clone_if_not_exist "https://github.com/cloudfoundry/route-registrar" "${HOME}/workspace/route-registrar"

# Routing API: interface for registering and deregistering routes for internal & external clients
clone_if_not_exist "https://github.com/cloudfoundry/routing-api" "${HOME}/workspace/routing-api"

# Application Connectivity Decision Repo contains a list of decision records made by the App Connectivity team
clone_if_not_exist "git@github.com:pivotal/tas-for-vms-networking-decisions.git" "${HOME}/workspace/tas-for-vms-networking-decisions"

# Routing Acceptance Tests
clone_if_not_exist "https://github.com/cloudfoundry/routing-acceptance-tests" "${HOME}/workspace/routing-acceptance-tests"

# CF K8S Networking
clone_if_not_exist "https://github.com/cloudfoundry/cf-k8s-networking" "${HOME}/workspace/cf-k8s-networking"

# CF for K8s
clone_if_not_exist "https://github.com/cloudfoundry/cf-for-k8s" "${HOME}/workspace/cf-for-k8s"

# Eirini
clone_if_not_exist "https://github.com/cloudfoundry-incubator/eirini" "${HOME}/workspace/eirini"

# Eirini BOSH Release
clone_if_not_exist "https://github.com/cloudfoundry-community/eirini-bosh-release" "${HOME}/workspace/eirini-bosh-release"

# Networking Program Checklists: Checklists (on-call, onboarding) and a kind of helpful wiki
clone_if_not_exist "git@github.com:cloudfoundry/networking-program-checklists" "${HOME}/workspace/networking-program-checklists"

# Networking OSS Deployments
clone_if_not_exist "git@github.com:cloudfoundry/networking-oss-deployments.git" "${HOME}/workspace/networking-oss-deployments"

# Routing Support Notes: List of support tickets, past and present, and a handy template to start your own.
clone_if_not_exist "git@github.com:pivotal/routing-support-notes" "${HOME}/workspace/routing-support-notes"

# Pivotal Networking CI -- pipeline and tasks for pivotal ci
clone_if_not_exist "git@github.com:pivotal/pivotal-networking-ci" "${HOME}/workspace/pivotal-networking-ci"

# Norsk Config -- for OSL
clone_if_not_exist "git@github.com:pivotal-cf/norsk-config" "${HOME}/workspace/norsk-config"

# Norsk repo for running OSL pipeline tasks locally
clone_if_not_exist "git@github.com:pivotal-cf/norsk.git" "${HOME}/workspace/norsk"

# Istio Envoy OSL scripts
clone_if_not_exist "git@github.com:pivotal/istio-envoy-osl.git" "${HOME}/workspace/istio-envoy-osl"

# App connectivy bot (Slackbot to nudge NSX-T questions to be asked elsewhere)
clone_if_not_exist "git@github.com:pivotal/app-connectivity-program-slackbot.git" "${HOME}/workspace/app-connectivity-program-slackbot"

# Community bot (script to get recently updated Github issues)
clone_if_not_exist "git@github.com:cf-routing/community-bot.git" "${HOME}/workspace/community-bot"

# TAS Tiles
clone_if_not_exist "git@github.com:pivotal-cf/p-runtime.git" "${HOME}/workspace/p-runtime"
clone_if_not_exist "git@github.com:pivotal-cf/p-isolation-segment.git" "${HOME}/workspace/p-isolation-segment"

# Unpack utility for recursive untar/unzip. Useful for log files from support
clone_if_not_exist "git@github.com:stephendotcarter/unpack.git" "${HOME}/workspace/unpack"

# Docs repos (that we know about)
clone_if_not_exist "git@github.com:cloudfoundry/docs-cf-admin.git" "${HOME}/workspace/docs-cf-admin"
clone_if_not_exist "git@github.com:cloudfoundry/docs-cloudfoundry-concepts.git" "${HOME}/workspace/docs-cloudfoundry-concepts"
clone_if_not_exist "git@github.com:cloudfoundry/docs-dev-guide" "${HOME}/workspace/docs-dev-guide"
clone_if_not_exist "git@github.com:pivotal-cf/docs-operating-pas.git" "${HOME}/workspace/docs-operating-pas"
clone_if_not_exist "git@github.com:pivotal-cf/docs-partials" "${HOME}/workspace/docs-partials"
clone_if_not_exist "git@github.com:pivotal-cf/docs-pcf-security" "${HOME}/workspace/docs-pcf-security"
clone_if_not_exist "git@github.com:cloudfoundry/docs-running-cf" "${HOME}/workspace/docs-running-cf"

# smith CLI for interacting with toolsmiths envs
clone_if_not_exist "git@github.com:pivotal/smith" "${HOME}/workspace/smith"
# Note: requires VPN access
# Install GlobalProtect (not automated because we can't distribute file ourselves)
# 1. Download https://drive.google.com/a/pivotal.io/file/d/1GxaJGgvoTapDjdq1J3qCkxRBAztIbtOQ/view?usp=sharing
# 2. tar -xzvf PanGPLinux-5.1.0-c101.tgz
# 3. gcloud beta compute scp --zone us-central1-a --project "cf-routing" GlobalProtect_deb-5.1.0.0-101.deb pivotal@${workstation}:~
# 4. sudo dpkg -i GlobalProtect_deb-5.1.0.0-101.deb
#
# Connect to VPN
# 1. globalprotect connect --portal portal-nasa.vpn.pivotal.io -u ${username}
# 2. Choose 1 (Okta verify)
#
# Install smith
# 1. cd ~/workspace/smith && go install

cd ~/workspace

echo "direnv allow all releases for all repos"
for direnvable in $(find . | grep envrc | sed -e 's/.\/\(.*\)\/.envrc/\1/'); do
  pushd $direnvable
  direnv allow
  popd
done

echo "scripts update all repos"
for release in $(find . | grep "scripts/update$" | sed -e 's/.\/\(.*\)\/scripts\/update/\1/'); do
  pushd $release
  ./scripts/update
  popd
done

