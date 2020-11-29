<?php
declare(strict_types=1);
/**
 * This is needed for cookie based authentication to encrypt password in
 * cookie. Needs to be 32 chars long.
 */
$cfg['blowfish_secret'] = 'dhYz-sPRuG.[a5tF;UG}1-VEeW:i;kAu'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
/**
 * First server
 */
$i = 1;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['tempDir'] = '/tmp';
/* Server parameters */
$cfg['Servers'][$i]['user'] = 'mysql';
$cfg['Servers'][$i]['password'] = 'password';
$cfg['Servers'][$i]['port'] = '3306';
$cfg['Servers'][$i]['host'] = 'mysql';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
/* Absolute URL necessary for redirect */
$cfg['PmaAbsoluteUri'] = '/phpmyadmin';
