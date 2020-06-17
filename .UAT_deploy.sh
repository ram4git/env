#!/bin/bash
source ~/.env
cd $TF
export BRANCH=sandbox
export HOST=sandbox
git checkout master

printf "${txtblu}[1/4] Fetching lastest git updates${txtrst}\n"
git fetch
printf  "${bldgrn}[1/4] ✔️ DONE${txtrst}\n"

printf "${txtblu}[2/4] Creating QA branch${txtrst}\n"
git branch -D current_sandbox
git checkout -b current_sandbox origin/current_sandbox
printf "${bldgrn}[2/4] ✔️ DONE${txtrst}\n"

printf "${txtblu}[3/4] Building the new build${txtrst}\n"
rm -rf built/
if yarn run build; then
    printf "${bldgrn}[3/4] ✔️ DONE${txtrst}\n"
else
    printf "${bldred}[3/4] 🤦🏻‍♂️ FAILED${txtrst}\n"
    exit 1
fi

printf "${txtblu}[4/4] Deploying latest build${txtrst}\n"
    printf "${txtblu}\t[i] Backing up existing deployment${txtrst}\n"
    if ssh root@${HOST} "rm -rf /usr/share/nginx/${BRANCH}.bak/*;cp -r /usr/share/nginx/${BRANCH}/* /usr/share/nginx/${BRANCH}.bak/; rm -rf /usr/share/nginx/${BRANCH}/*"; then
        printf "${bldgrn}\t[i] ✔️ DONE${txtrst}\n"
    else
        printf "${bldred}\t[i] 🤦🏻‍♂️ FAILED${txtrst}\n"
        exit 1
    fi
printf "${txtblu}\t[ii]Copying${txtrst}\n"
    if     scp -r built/* root@${HOST}:/usr/share/nginx/${BRANCH}/; then
        printf "${bldgrn}\t[ii]✔️ DONE${txtrst}\n"
    else
        printf "${bldred}\t[ii] 🤦🏻‍♂️ FAILED${txtrst}\n"
        exit 1
    fi
printf "${txtblu}\t[iii]Restring NGINX server${txtrst}\n"

    if ssh root@${HOST} "service nginx stop; service nginx start"; then
        printf "${bldgrn}[4/4] ✔️ DONE${txtrst}\n"
    else
        printf "${bldred}[4/4] 🤦🏻‍♂️ FAILED${txtrst}\n"
        exit 1
    fi
printf "\n"
printf "${txtblu}🎉🎊🎈🎉 Deployed${txtrst}"
