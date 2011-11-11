use inc::Module::Install;
name 'Acme-Text-Glitch';
all_from 'lib/Acme/Text/Glitch.pm';
readme_from 'lib/Acme/Text/Glitch.pm';
readme_markdown_from 'lib/Acme/Text/Glitch.pm';
readme_pod_from 'lib/Acme/Text/Glitch.pm';
githubmeta;


tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
