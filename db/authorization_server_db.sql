CREATE SCHEMA `authorization_server_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL ON authorization_server_db.* to 'root'@'localhost';


DROP TABLE IF EXISTS `oauth2_registered_client`;

CREATE TABLE `oauth2_registered_client`
(
    `id`                            varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `client_id`                     varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `client_id_issued_at`           timestamp                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `client_secret`                 varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL,
    `client_secret_expires_at`      timestamp NULL DEFAULT NULL,
    `client_name`                   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `client_authentication_methods` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `authorization_grant_types`     varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `redirect_uris`                 varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL,
    `post_logout_redirect_uris`     varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL,
    `scopes`                        varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `client_settings`               varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `token_settings`                varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- client_id: client, client_secret: secret
INSERT INTO `oauth2_registered_client`
VALUES ('c0', 'client', '2023-07-12 03:11:11', '{bcrypt}$2a$10$XSr.ceJwuX0S.H7bo8G7JOTtEzOFBye3NazlwEGlJ7OB02BCPBvTS', NULL, 'client with secret',
        'client_secret_basic,client_secret_post', 'authorization_code,refresh_token,client_credentials',
        'https://oauthdebugger.com/debug', 'http://127.0.0.1:8080/', 'openid,read,all',
        '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":false}',
        '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.access-token-format\":{\"@class\":\"org.springframework.security.oauth2.server.authorization.settings.OAuth2TokenFormat\",\"value\":\"self-contained\"},\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000],\"settings.token.authorization-code-time-to-live\":[\"java.time.Duration\",300.000000000]}');



DROP TABLE IF EXISTS `oauth2_authorization`;

CREATE TABLE oauth2_authorization
(
    id                            varchar(100) NOT NULL,
    registered_client_id          varchar(100) NOT NULL,
    principal_name                varchar(200) NOT NULL,
    authorization_grant_type      varchar(100) NOT NULL,
    authorized_scopes             varchar(1000) DEFAULT NULL,
    attributes                    blob          DEFAULT NULL,
    state                         varchar(500)  DEFAULT NULL,
    authorization_code_value      blob          DEFAULT NULL,
    authorization_code_issued_at  timestamp     DEFAULT NULL,
    authorization_code_expires_at timestamp     DEFAULT NULL,
    authorization_code_metadata   blob          DEFAULT NULL,
    access_token_value            blob          DEFAULT NULL,
    access_token_issued_at        timestamp     DEFAULT NULL,
    access_token_expires_at       timestamp     DEFAULT NULL,
    access_token_metadata         blob          DEFAULT NULL,
    access_token_type             varchar(100)  DEFAULT NULL,
    access_token_scopes           varchar(1000) DEFAULT NULL,
    oidc_id_token_value           blob          DEFAULT NULL,
    oidc_id_token_issued_at       timestamp     DEFAULT NULL,
    oidc_id_token_expires_at      timestamp     DEFAULT NULL,
    oidc_id_token_metadata        blob          DEFAULT NULL,
    refresh_token_value           blob          DEFAULT NULL,
    refresh_token_issued_at       timestamp     DEFAULT NULL,
    refresh_token_expires_at      timestamp     DEFAULT NULL,
    refresh_token_metadata        blob          DEFAULT NULL,
    user_code_value               blob          DEFAULT NULL,
    user_code_issued_at           timestamp     DEFAULT NULL,
    user_code_expires_at          timestamp     DEFAULT NULL,
    user_code_metadata            blob          DEFAULT NULL,
    device_code_value             blob          DEFAULT NULL,
    device_code_issued_at         timestamp     DEFAULT NULL,
    device_code_expires_at        timestamp     DEFAULT NULL,
    device_code_metadata          blob          DEFAULT NULL,
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `oauth2_authorization_consent`;
CREATE TABLE oauth2_authorization_consent
(
    registered_client_id varchar(100)  NOT NULL,
    principal_name       varchar(200)  NOT NULL,
    authorities          varchar(1000) NOT NULL,
    PRIMARY KEY (registered_client_id, principal_name)
);



DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user`
(
    `id`              BIGINT UNSIGNED NOT NULL,
    `username`        VARCHAR(64) CHARACTER SET UTF8MB4  NOT NULL,
    `password`        VARCHAR(256) CHARACTER SET UTF8MB4 NOT NULL DEFAULT '',
    `type`            SMALLINT                           NOT NULL DEFAULT '1',
    `last_login_time` TIMESTAMP                          NOT NULL DEFAULT '2023-07-01 00:00:00',
    `status`          SMALLINT UNSIGNED NOT NULL DEFAULT '1',
    `deleted`         TINYINT UNSIGNED NOT NULL DEFAULT '0',
    `version`         INT UNSIGNED NOT NULL DEFAULT '0',
    `create_time`     TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`     TIMESTAMP                          NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE=INNODB DEFAULT CHARSET=UTF8MB4 COLLATE = UTF8MB4_UNICODE_CI;

INSERT INTO `auth_user`
    (`id`, `username`, `password`)
VALUES (10000000000000,
        'user',
        '{bcrypt}$2a$10$ssdSQaDns1YwgGE8.NEA.efflOxt6.d8lh4Ss/tCPFfXTV03UbPSC');

INSERT INTO `auth_user`
(`id`,
 `username`,
 `password`)
VALUES (10000000000001,
        'haichen',
        '{bcrypt}$2a$10$pGUmT6YOVu5wBJU57BNr9.SGnVacUxE0TjsU0ypG7FHH/..E6M6jW');
