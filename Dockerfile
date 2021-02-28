FROM dependabot/dependabot-core

COPY Gemfile Gemfile.lock ./
RUN bundle install

ENV GITLAB_HOSTNAME=sig-gitlab.internal.synopsys.com/
ARG KIRA_GITHUB_PERSONAL_TOKEN_ARG
ENV KIRA_GITHUB_PERSONAL_TOKEN=$KIRA_GITHUB_PERSONAL_TOKEN_ARG
ARG KIRA_GITLAB_PERSONAL_TOKEN_ARG
ENV KIRA_GITLAB_PERSONAL_TOKEN=$KIRA_GITLAB_PERSONAL_TOKEN_ARG

ARG PROJECT
ENV DEPENDABOT_PROJECT_PATH=tinfoil/$PROJECT
ARG DIR=/
ENV DEPENDABOT_DIRECTORY=$DIR
ARG PACKAGE_MANAGER_ARG
ENV PACKAGE_MANAGER=$PACKAGE_MANAGER_ARG
ENV PACKAGE_MANAGER_SET=$PACKAGE_MANAGER

COPY update.rb ./

CMD bundle exec ruby update.rb
