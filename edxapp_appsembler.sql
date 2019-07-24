-- Appsembler: Optimizations

-- Reset the `edx` user password to `edx`
UPDATE `auth_user` SET `password` = 'pbkdf2_sha256$36000$j1fdNwBlDFeV$zTRlYpuvnd0VUuJDjgmUNkRQbUp26fjbJnK6NDg3d2s=' WHERE `username` = 'edx';

-- Create the AMC OAuth client
INSERT INTO `oauth2_client` VALUES (NULL, "AMC", "http://localhost:9000/", "http://localhost:9000/oauth2/access_token/", "6f2b93d5c02560c3f93f", "2c6c9ac52dd19d7255dd569fb7eedbe0ebdab2db", 0, NULL, NULL);
INSERT INTO `oauth2_provider_trustedclient` VALUES (NULL, (SELECT `id` FROM `oauth2_client` WHERE `oauth2_client`.`name` = 'AMC' LIMIT 1));

-- Creates the vanilla theme site for debugging theme issues
INSERT INTO `django_site` VALUES (NULL,'localhost:18000','localhost:18000');
INSERT INTO `theming_sitetheme` VALUES (NULL, '-', (SELECT id FROM `django_site` WHERE `domain` = 'localhost:18000' LIMIT 1));
