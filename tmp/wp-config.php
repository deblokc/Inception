<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'WordPress' );

/** Database username */
define( 'DB_USER', 'tnaton' );

/** Database password */
define( 'DB_PASSWORD', 'motdepasse' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'BnK^j@: {@qjX=478uYTy/ZBf6`5A-6mQGf%NErLdgldi|#s8Tqhu8>%k{dg_uDb' );
define( 'SECURE_AUTH_KEY',   'h|EfEyR21aSpgQ4L#7b+Ryoc9V1oQEoEj-lD?/+)1w%;/=N{6~Ed[^d]@YhH?14V' );
define( 'LOGGED_IN_KEY',     'C#11z,N4l)x~;4<dsH?|vzth g($Yxf xQ/_9|lCjp-^IAJLS2#geCd-uC2 4xK/' );
define( 'NONCE_KEY',         '3g<f %She. $wWQxpnlCu;5(5ny9lGme8<%1(cs(o<;75,UB}L93.-$(PQB$vp|8' );
define( 'AUTH_SALT',         '39xq7PDUK($M?UlnV<uA`9#)k(#Y|7[Fo:yP~3phfQhc^4m2@@y@W0%VD;Ls38bN' );
define( 'SECURE_AUTH_SALT',  '!aY{c+7``V*8MB.o=?_#tz;DHQqBM!&rvtQ?kppT8YWKZc0.`Rq|%uL)y)O8LC>&' );
define( 'LOGGED_IN_SALT',    '&qQ-2_l&63St*Y|(fv:wsx?Vg)~[7NMRitkgrqxW2;|3c^l_Us!M.J=W[tZYzy4a' );
define( 'NONCE_SALT',        'y9J@yliI:?~4/V2<<4NjfB5&M/vxA^lN;fR$,$F=B2FuJvwTz9,(+YU9Wj`N]v3G' );
define( 'WP_CACHE_KEY_SALT', 'J~?F-46-!L j)XX>[e.cuxG,3?.L@|`,+q~=X.HpoTP#LjmB k_#:jb{?bo=U/  ' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );


/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
