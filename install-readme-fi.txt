### Järjestelmävaatimukset ###

Palvelin:
- PHP 5.1 tai uudempi (Viimeisin vakaa versio suositeltu)
- MySQL 4 tai uudempi

Asiakas:
- Javascript/DOM toimiva selain (testattu Firefox 2/3, Internet Explorer 7, Opera 9, Konqueror, Safari)
- Evästeet sallittu


### Asennusohjeet ###

    1. Pura asennuspaketti.
    2. Siirrä kaikki, myös tyhjät /files ja /templates_c kansiot palvelimelle.
	   (Vaihtoehtoisesti voit luoda /templates_c ja /files käsin ennen asennusta.)
	3. Salli seuraavien kansioiden ja tiedostojen kirjoitusoikeudet:

		- /templates_c
		- /files
		- /config/standard/config.php

	4. Luo uusi MySQL tietokanta Collabtivea varten.
	5. Siirry selaimella osoitteeseen: install.php ja seuraa annettuja ohjeita.
	6. Kun asennus on valmis, poista install.php ja update.php tiedostot palvelimelta.


### Päivitysohjeet ###

	1. Pura Collabtive paketti
	2. Nouda oma config.php palvelimeltasi
	3. Laita config.php kansioon /config/standard/, korvaa tyhjä tiedosto.
	4. Siirrä kaikki tiedostot palvelimelle, korvaa kaikki vanhemmat Collabtiven tiedostot
	5. Siirry selaimella osoitteeseen:update.php
	6. Jos päivitys onnistui, poista install.php ja update.php tiedostot palvelimelta.


### License conditions ###

Collabtive is free software under the terms and conditions of the
GNU General Public License (GPL) (Version 3).
Please see license.txt for full licensing terms and conditions.


### Credits ###

- Collabtive is (c) Philipp Kiszka
- Project coordination and support by Eva Kiszka
- Artwork by Marcus Fröhner
- Icons are partially taken from the Oxygen iconset.
- Many locales maintained by various contributors.