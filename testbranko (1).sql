-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 01, 2022 at 07:35 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testbranko`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_articles`
--

DROP TABLE IF EXISTS `tbl_articles`;
CREATE TABLE IF NOT EXISTS `tbl_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `date` datetime NOT NULL,
  `capture` varchar(15) NOT NULL,
  `pageDate` datetime DEFAULT '2022-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_articles`
--

INSERT INTO `tbl_articles` (`id`, `user`, `title`, `description`, `url`, `date`, `capture`, `pageDate`) VALUES
(2, 'danielstarek@yahoo.com', 'example2', '', 'http://www.example.com/', '2022-04-30 23:15:00', 'later', '2022-01-01 00:00:00'),
(4, 'usr', 'Lavrov: Co na tom, že Zelenskyj je Žid? Tato skutečnost nepopírá nacistické prvky na Ukrajině. Hitler měl také židovskou krev', 'Šéf ruské diplomace označil ukrajinské jednotky za nacistické a prohlásil, že ukrajinské útoky na Donbas jsou jasně zacíleny na terorizování civilistů.\n', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', '2022-05-02 07:39:00', '1651484415085', '2022-01-01 00:00:00'),
(5, 'adxalert@gmx.com', 'Ceny pohonných hmot v ČR nadále rostou, nafta zdražuje rychleji', 'Praha - Ceny pohonných hmot u českých čerpacích stanic nadále rostou. Litr Naturalu 95 stojí průměrně 42,77 koruny, litr nafty 44,15 Kč. Nafta zdražuje rychleji, v porovnání s pátkem jsou její ceny vyšší o 1,83 koruny, benzin zdražil za stejnou dobu ', 'https://www.ceskenoviny.cz/zpravy/ceny-pohonnych-hmot-v-cr-nadale-rostou-nafta-zdrazuje-rychleji/2173354', '2022-05-02 07:48:00', '1651484937705', '2022-01-01 00:00:00'),
(6, 'adxalert@gmx.com', 'Ruské banky sa kvôli odchodu Visy a Mastercardu obracajú k čínskemu systému', 'Najväčšia ruská banková spoločnosť Sberbank podľa agentúry Bloomberg uviedla, že skúma možnosť vydávať platobné karty s využitím čínskeho systému UnionPay či ruského systému Mir', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', '2022-05-02 07:51:00', '1651485150218', '2022-01-01 00:00:00'),
(7, 'danielstarek@yahoo.com', 'Odesa 2. Máj 2014- Memento fašizmu  : NazorObcana.sk', 'PRED ROKOM SA ODOHRALA V ODESE TRAGÉDIA. ZABUDNÚŤ NA ŇU BY ZNAMENALO REZIGNOVAŤ NA ĽUDSKOSŤ. VŠETCI, KTORÍ ODMIETAME BYŤ ĽAHOSTAJNÍ K TOMU, ČO SA STALO 2.MÁJA 2014, NEMÔŽEME MLČAŤ, UŽ AJ KVÔLI ĽUĎOM, KTORÍ SA SVETSKEJ SPRAVODLIVOSTI NEDOČKALI.\n', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', '2022-05-02 07:55:00', '1651485351126', '2022-01-01 00:00:00'),
(8, 'danielstarek@yahoo.com', '67. deň: Z areálu Azovstaľ podľa Zelenského evakuovali okolo 100 ľudí', 'V ukrajinskom meste Mariupol aktuálne prebieha operácia Organizácie Spojených národov, ktorej cieľom je evakuovať civilistov z komplexu oceliarní Azovstaľ, potvrdil v nedeľu hovorca humanitárneho úradu OSN Saviano Abreu. TASR túto informáciu prevzala', 'https://spravy.pravda.sk/svet/clanok/625186-online-agonia-azovstalu-starosta-hovori-o-hodinach-zivota', '2022-05-02 08:00:00', '1651485652590', '2022-01-01 00:00:00'),
(9, 'adxalert@gmx.com', 'Ukraine war: Zelensky plea as Russians seek Mariupol endgame', '', 'https://www.bbc.com/news/world-europe-61327638', '2022-05-05 07:14:00', '1651713337457', '2022-01-01 00:00:00'),
(10, 'adxalert@gmx.com', 'Ukraine says it is \'ready\' if Belarus joins Russian war effort', '', 'https://www.reuters.com/world/europe/ukraine-says-it-is-ready-if-belarus-joins-russian-war-effort-2022-05-04', '2022-05-05 07:16:00', '1651713438263', '2022-01-01 00:00:00'),
(11, 'usr', 'Ukraine says it is \'ready\' if Belarus joins Russian war effort', '', 'https://www.reuters.com/world/europe/ukraine-says-it-is-ready-if-belarus-joins-russian-war-effort-2022-05-04', '2022-05-05 07:35:00', '1651714531749', '2022-01-01 00:00:00'),
(12, 'usr', 'U.S. intelligence helping Ukraine kill Russian generals -NY Times', '', 'https://www.reuters.com/world/europe/us-intelligence-helping-ukraine-kill-russian-generals-ny-times-2022-05-05', '2022-05-05 07:37:00', '1651714654875', '2022-01-01 00:00:00'),
(13, 'usr', 'Berlin says it will work for EUFOR Bosnia extension amid Russia concerns', '', 'https://www.reuters.com/world/europe/berlin-says-it-will-work-eufor-bosnia-extension-amid-russia-concerns-2022-05-04', '2022-05-05 07:39:00', '1651714788509', '2022-01-01 00:00:00'),
(14, 'danielstarek@yahoo.com', 'Rusko máva tajným rozkazom Kyjeva napadnúť Donbas, žiada vysvetliť biologické zbrane', '11115555', 'https://hnonline.sk/svet/23407639-rusko-mava-tajnym-rozkazom-kyjeva-napadnut-donbas-ziada-vysvetlit-biologicke-zbrane', '2022-05-05 10:17:00', '1651753095761', '2022-01-01 00:00:00'),
(15, 'danielstarek@yahoo.com', 'Moskve sa nepodarilo obkľúčiť Kyjev, podľa Britov sa zrejme sústredí na Donbas', 'TEst test edit', 'https://www.trend.sk/spravy/moskve-nepodarilo-obklucit-kyjev-podla-britov-zrejme-sustredi-donbas', '2022-05-05 10:22:00', '1651753345430', '2022-01-01 00:00:00'),
(16, 'usr', 'wefw', 'sdf', 'https://technotip.com/3674/node-js-video-tutorial-list', '2022-05-08 14:42:00', '1652010081659', '2022-01-01 00:00:00'),
(17, 'usr', 'Node.js Tutorial: How to Build a Video Streaming Application in 10 Minutes | HackerNoon', '', 'https://hackernoon.com/nodejs-tutorial-how-to-build-a-video-streaming-application-in-10-minutes', '2022-05-08 14:43:00', '1652010152175', '2022-01-01 00:00:00'),
(18, 'usr', 'Simple CSS Underline Menu - Codepad', '32432', 'https://codepad.co/snippet/simple-css-underline-menu', '2022-05-08 18:26:00', '1652023546027', '2022-01-01 00:00:00'),
(19, 'usr', 'W3Schools online HTML editor', '', 'https://www.w3schools.com/howto/tryit.asp', '2022-05-08 18:33:00', '1652023939097', '2022-01-01 00:00:00'),
(20, 'usr', 'W3Schools online HTML editor', '', 'https://www.w3schools.com/icons/tryit.asp', '2022-05-08 20:08:00', '1652029632885', '2022-01-01 00:00:00'),
(21, 'usr', '', '', 'https://www.google.com/search', '2022-05-08 20:23:00', '1652030520686', '2022-01-01 00:00:00'),
(22, 'usr', 'Olaf Scholz: Ukraine won\'t accept Russian dictatorship | DW | 08.05.2022', 'German Chancellor Olaf Scholz says he strongly believes Russia won\'t win its war in Ukraine. His remarks come as the conflict overshadows commemorations to mark the end of World War II in Europe.', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', '2022-05-09 11:39:00', '1652103598222', '2022-01-01 00:00:00'),
(23, 'danielstarek@yahoo.com', 'Olaf Scholz: Ukraine won\'t accept Russian dictatorship | DW | 08.05.2022', 'German Chancellor Olaf Scholz says he strongly believes Russia won\'t win its war in Ukraine. His remarks come as the conflict overshadows commemorations to mark the end of World War II in Europe.', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', '2022-05-09 11:43:00', '1652103814124', '2022-01-01 00:00:00'),
(25, 'danielstarek@yahoo.com', 'Nemecko pomôže Česku nahradiť ťažkú vojenskú techniku odoslanú na Ukrajinu', '', 'https://www.trend.sk/spravy/scholz-nemecko-pomoze-cesku-nahradit-tazku-techniku-odoslanu-ukrajinu', '2022-05-09 11:46:00', '1652104005200', '2022-01-01 00:00:00'),
(26, 'usr', '', '', 'https://translate.google.com', '2022-05-10 14:04:00', '1652180587388', '2022-01-01 00:00:00'),
(27, 'usr', 'How to record a Selected part of the screen', '', 'https://stackoverflow.com/questions/67900079/how-to-record-a-selected-part-of-the-screen', '2022-05-10 14:05:00', '1652180650102', '2022-01-01 00:00:00'),
(28, 'danielstarek@yahoo.com', 'Ukrajina přeruší tranzit ruského plynu do Evropy přes stanici Sochranovka. Gazprom ale jinou trasu odmítl', 'Provozovatel ukrajinského systému pro přepravu plynu GTSOU ve středu ráno přeruší tranzit ruského plynu do Evropy přes měřicí stanici Sochranovka. Firma tento krok zdůvodnila aktivitami ruských okupačních sil. Upozornila, že ke splnění tranzitních zá', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', '2022-05-11 06:04:00', '1652256309148', '2022-01-01 00:00:00'),
(30, 'usr', 'VIDEO: Buď nastolíme civilizáciu mieru, lásky & spravodlivosti alebo sa necháme zničiť plánom  na vytvorenie masového chaosu a násilia prostredníctvom nihilistov, ateistov a revolucionárov ', '', 'https://www.infovojna.bz/article/video-bud-nastolime-civilizaciu-mieru-lasky-spravodlivosti-alebo-sa-nechame-znicit-planom-na-vytvorenie-masoveho-chaosu-a-nasilia-prostrednictvom-nihilistov-ateistov-a-revolucionarov', '2022-05-14 13:34:00', '1652542497342', '2022-01-01 00:00:00'),
(31, 'usr', 'title2', 'desc2', 'http://example2.com', '2022-05-18 23:01:00', '2', '2022-01-01 00:00:00'),
(32, 'danielstarek@yahoo.com', 'Slávni miliardári zdvihli varovný prst a predali akcie veľkých firiem', 'Ikonický investor, ktorý predpovedal pád realitného trhu v roku 2008, si teraz stavil na pokles technologického giganta. George Soros sa pridal a vypredáva tiež', 'https://www.trend.sk/financie/slavni-miliardari-zdvihli-varovny-prst-predali-akcie-velkych-firiem', '2022-05-18 17:41:00', 'default', '2022-01-01 00:00:00'),
(33, 'usr', 'Pokračujúce útoky na oceliareň Azovstaľ by mohli viesť k ekologickej katastrofe', '', 'https://www.trend.sk/spravy/unian-boje-azovstal-hrozia-ekologickou-katastrofou-azovskom-mori', '2022-05-19 23:48:00', '1652982890427', '2022-01-01 00:00:00'),
(34, 'danielstarek@yahoo.com', 'Vysoká inflácia ničí východnú Európu. Môže za to Putin alebo chybná politika ECB?', 'Putinflácia devastuje poľskú ekonomiku, tvrdí vláda. Ide ale viac o propagandu ako realitu', 'https://www.trend.sk/nazory-a-komentare/vysoka-inflacia-nici-vychodnu-europu-moze-to-putin-alebo-chybna-politika-ecb', '2022-05-20 12:35:00', '1653057325432', '2022-01-01 00:00:00'),
(35, 'danielstarek@yahoo.com', 'Poľsko rokuje s Portugalskom o prekládke LNG pre európske krajiny', '', 'https://www.trend.sk/spravy/polsko-rokuje-portugalskom-prekladke-lng-pre-europske-krajiny', '2022-05-20 12:35:00', 'later', '2022-01-01 00:00:00'),
(36, 'danielstarek@yahoo.com', 'Rusi zaradili spätný chod. Chystajú oživenie výroby sovietskych Moskvičov', 'test test', 'https://www.trend.sk/spravy/rusi-zaradili-spatny-chod-chystaju-ozivenie-vyroby-sovietskych-moskvicov', '2022-05-20 13:46:00', 'later', '2022-01-01 00:00:00'),
(37, 'danielstarek@yahoo.com', 'Rozkol v Syndikáte: Ukrajina by sa nemala so Západom usilovať o porážku Ruska. Miesto toho by sa mala Ukrajina vzdať časti územia, vyhlásil Kissinger na stretnutí globálnych „elít“ v Davose. Von der Leyenová vyslovila opačný názor', 'test of the article features', 'https://www.infovojna.bz/article/rozkol-v-syndikate-ukrajina-by-sa-nemala-so-zapadom-usilovat-o-porazku-ruska-miesto-toho-by-sa-mala-ukrajina-vzdat-casti-uzemia-vyhlasil-kissinger-na-stretnuti-globalnych-elit-v-davose-von-der-leyenova-vyslovila-opacny-nazor', '2022-05-24 17:26:00', 'later', '2022-01-01 00:00:00'),
(38, 'danielstarek@yahoo.com', 'Majiteľ Slovnaftu nestíha rátať miliardy, embargo sa odkladá', '', 'https://www.trend.sk/ekonomika/majitel-slovnaftu-nestiha-ratat-miliardy-embargo-odklada', '2022-05-25 09:32:00', '1653491314539', '2022-01-01 00:00:00'),
(39, 'danielstarek@yahoo.com', 'Progresívne Slovensko už nebude podporovať súčasnú vládu, hovorí Šimečka - TA3', '', 'https://www.ta3.com/clanok/236982/progresivne-slovensko-uz-nebude-podporovat-sucasnu-vladu-hovori-simecka', '2022-05-25 09:33:00', 'default', '2022-01-01 00:00:00'),
(40, 'usr', 'title1', 'desc1', 'http://example1.com', '2022-05-25 19:03:00', '1', '2022-01-01 00:00:00'),
(41, 'usr', 'Matovičov balíček podľa Pellegriniho možno nazvať prorodinný, no nie protiinflačný - TA3', '', 'https://www.ta3.com/clanok/236983/matovicov-balicek-podla-pellegriniho-mozno-nazvat-prorodinny-no-nie-protiinflacny', '2022-05-25 19:05:00', '1653483950690', '2022-01-01 00:00:00'),
(42, 'danielstarek@yahoo.com', 'Rakúsko sa vzdalo plánu predĺžiť širokorozchodnú železnicu z Košíc do Viedne', 'ÖBB sa vzdáva svojho podielu v spoločnej firme so Slovenskom, Ukrajinou a Ruskom.', 'https://www.trend.sk/spravy/rakusko-vzdalo-planu-predlzit-sirokorozchodnu-zeleznicu-kosic-viedne', '2022-05-25 13:00:00', 'default', '2022-01-01 00:00:00'),
(43, 'danielstarek@yahoo.com', 'Za populizmus sa platí: Orbán zavádza zdaňovanie nadmerných ziskov veľkých spoločností', '', 'https://www.trend.sk/spravy/populizmus-musi-zaplatit-orban-zavadza-zdanovanie-nadmernych-ziskov-velkych-spolocnosti', '2022-05-25 17:24:00', 'default', '2022-01-01 00:00:00'),
(44, 'danielstarek@yahoo.com', 'Čína uvoľňuje blokády, len Tesla nie. Zamestnanci pracujú v uzavretej slučke ďalej', 'zaujmave info o tesle', 'https://www.trend.sk/spravy/cina-uvolnuje-blokady-len-tesla-nie-zamestnanci-pracuju-uzavretej-slucke-dalej', '2022-05-25 17:24:00', 'default', '2022-01-01 00:00:00'),
(45, 'danielstarek@yahoo.com', 'Dobrý vojak je šťastný, platený a živený. Ruský vojak to nie je ', 'testing new updates', 'https://www.trend.sk/spravy/dobry-vojak-je-stastny-plateny-ziveny-rusky-vojak-to-nie-je', '2022-05-25 17:46:00', 'default', '2022-01-01 00:00:00'),
(46, 'danielstarek@yahoo.com', 'O stretnutia nemám núdzu, hrdí sa ruský veľvyslanec v Bruseli. Vravia o ňom, že si vymýšľa', 'Ruský veľvyslanec v Bruseli venoval posledných 17 rokov upevňovaniu vzťahov medzi EÚ a Moskvou', 'https://www.trend.sk/spravy/rusky-velvyslanec-tvrdi-nema-nudzu-pracovne-stretnutia-aj-napriek-odsudeniu-ruska', '2022-05-25 17:48:00', '1653508159024', '2022-01-01 00:00:00'),
(47, 'danielstarek@yahoo.com', 'Elektromobil Piëch sa nabije za osem minút a SpaceX prudko stúpla hodnota', '', 'https://www.trend.sk/technologie/elektromobil-piech-nabije-osem-minut-spacex-prudko-stupla-hodnota', '2022-05-26 04:53:00', 'later', '2022-01-01 00:00:00'),
(48, 'danielstarek@yahoo.com', 'Slovensko má našliapnuté stať sa najchudobnejšou krajinou v regióne Vyšehradskej štvorky', 'skusam testovat', 'https://www.trend.sk/ekonomika/slovensko-ma-nasliapnute-stat-najchudobnejsou-krajinou-regionu', '2022-05-26 04:53:00', 'later', '2022-01-01 00:00:00'),
(49, 'danielstarek@yahoo.com', 'USA zaviedli sankcie voči sieti pašerákov s prepojeniami na iránske teroristické skupiny a ruskú vládu - TA3', 'skudam ci to dalej bude fungovat', 'https://www.ta3.com/clanok/237055/usa-zaviedli-sankcie-voci-sieti-paserakov-s-prepojeniami-na-iranske-teroristicke-skupiny-a-rusku-vladu', '2022-05-26 04:57:00', '1653548422476', '2022-01-01 00:00:00'),
(50, 'usr', 'Matovič sa nemusí báť Čaputovej veta. Oveľa väčším problémom bude, ak sa obráti na Ústavný súd', 'Vyššie prídavky na deti, väčší daňový bonus aj krúžkovné vo výške 60 eur majú rodičia dostávať od januára budúceho roka. Ak by sa prezidentka obrátila na Ústavný súd, v krajnom prípade by sa vyplácať nezačali.', 'https://www.aktuality.sk/clanok/s3AMIPr/matovic-sa-nemusi-bat-caputovej-veta-ovela-vacsim-problemom-bude-ak-sa-obrati-na-ustavny-sud', '2022-06-01 06:25:00', '1654072003543', '2022-01-01 00:00:00'),
(51, 'usr', 'Rok v konflikte. Ako sa Matovičova vláda prepracovala od nástupu ku kríze', 'Presne pred rokom, v sobotu 21. marca 2020, prezidentka Zuzana Čaputová vymenovala Igora Matoviča za premiéra. Tieto dni sa rozhoduje, či ním zostane aj naďalej.', 'https://dennikn.sk/2318300/rok-v-konflikte-ako-sa-matovicova-vlada-prepracovala-od-nastupu-ku-krize', '2022-06-01 06:27:00', '1654072059346', '2022-01-01 00:00:00'),
(52, 'usr', 'Olaf Scholz’s dithering is damaging Germany’s international image', 'German by Germany’s nato delegation', 'https://www.economist.com/europe/2022/05/31/olaf-scholzs-dithering-is-damaging-germanys-international-image', '2022-06-01 06:39:00', '1654072760049', '2022-01-01 00:00:00'),
(53, 'usr', 'Chaos z britských letísk k nám zatiaľ nedorazil. Dovolenky však ešte len začínajú', '', 'https://www.trend.sk/spravy/chaos-britskych-letisk-nam-zatial-nedorazil-dovolenky-vsak-este-len-zacinaju', '2022-06-04 06:17:00', '1654331010679', '2022-01-01 00:00:00'),
(54, 'usr', 'Mladý farmár z Vranova mení pohľad na chov dobytka', '', 'https://www.trend.sk/trend-archiv/mlady-farmar-vranova-meni-pohlad-chov-dobytka', '2022-06-04 06:24:00', '1654331056340', '2022-01-01 00:00:00'),
(56, 'danielstarek@yahoo.com', 'Mladý farmár z Vranova mení pohľad na chov dobytka', '', 'https://www.trend.sk/trend-archiv/mlady-farmar-vranova-meni-pohlad-chov-dobytka', '2022-06-04 06:28:00', '1654333942979', '2022-01-01 00:00:00'),
(57, 'danielstarek@yahoo.com', '', '', 'http://example.com', '2022-06-20 20:03:00', '1655733815069', '2022-01-01 00:00:00'),
(58, 'danielstarek@yahoo.com', 'BBC - Homepage', '', 'https://www.bbc.com', '2022-06-20 20:23:00', '1659132008036', '2022-01-01 00:00:00'),
(59, 'danielstarek@yahoo.com', 'POLITOLOG IŠČENKO VYSVĚTLIL, CO ZNAMENÁ DOPRAVNÍ BLOKÁDA KALININGRADU LITVOU. LITVA DEFACTO VYHLÁSILA VÁLKU RUSKU', '', 'https://cz24.news/politolog-iscenko-vysvetlil-co-znamena-dopravni-blokada-kaliningradu-litvou-litva-defacto-vyhlasila-valku-rusku', '2022-06-21 06:31:00', '1655800373043', '2022-01-01 00:00:00'),
(60, 'danielstarek@yahoo.com', 'VLČÍ DOUPĚ V TROSKÁCH. RUSKÁ ARMÁDA ROZMETALA VELITELSTVÍ U DNĚPROPETROVSKU, ZAHYNULO 50 GENERÁLŮ. LITVA BLOKÁDOU KAL', '', 'https://cz24.news/vlci-doupe-v-troskach-ruska-armada-rozmetala-velitelstvi-u-dnepropetrovsku-zahynulo-50-generalu-litva-blokadou-kaliningradu-vyhlasila-moskve-valku-prituhuje', '2022-06-21 19:00:00', '1655845281882', '2022-01-01 00:00:00'),
(61, 'danielstarek@yahoo.com', 'Elon Musk (@elonmusk) / Twitter', '', 'https://twitter.com/elonmusk', '2022-06-21 19:01:00', '1655845319963', '2022-01-01 00:00:00'),
(62, 'danielstarek@yahoo.com', 'Litva blokuje tranzit zboží z Ruska do jeho enklávy Kaliningrad. Litevci pocítí následky svých nenávistných omezení, vzkázala Moskva', '', 'https://www.infovojna.bz/article/litva-blokuje-tranzit-zbozi-z-ruska-do-jeho-enklavy-kaliningrad-litevci-pociti-nasledky-svych-nenavistnych-omezeni-vzkazala-moskva', '2022-06-21 19:04:00', '1655845506467', '2022-01-01 00:00:00'),
(63, 'danielstarek@yahoo.com', 'Aj spotrebné dane majú svoj limit. Ich prestrelenie podporuje nelegálny trh, ukázalo Francúzsko', 'Najnovšia štúdia od KPMG vrhá tieň pochybnosti na zámery prudko zvyšovať dane', 'https://www.trend.sk/spravy/aj-spotrebne-dane-maju-svoj-limit-ich-prestrelenie-podporuje-nelegalny-trh-ukazalo-francuzsko', '2022-06-23 07:52:00', '1655977949480', '2022-01-01 00:00:00'),
(64, 'danielstarek@yahoo.com', 'Zázrak ve vědecké sféře dokazuje, že podávání na ruku je duchovní zločin', '', 'https://apologie.info/20220619_rm_zazrak_dokazuje_podavani_na_ruku_je_zlocin', '2022-06-24 19:18:00', '1656105679751', '2022-01-01 00:00:00'),
(65, 'danielstarek@yahoo.com', 'Radomír Malý: Zázrak vo vedeckej sfére dokazuje, že podávanie na ruku je duchovný zločin. Naliehavo vyzývame všetkých verných katolíkov, ktorí navštevujú NOM omše, aby zásadne neprijímali na ruku', '', 'http://alianciazanedelu.sk/archiv/11876', '2022-06-24 19:19:00', '1656105599564', '2022-01-01 00:00:00'),
(66, 'danielstarek@yahoo.com', 'Tragédia v bratislavskej Petržalke. Polícia našla v lese obeseného mladého muža - TA3', '', 'https://www.ta3.com/clanok/239449/tragedia-v-bratislavskej-petrzalke-policia-nasla-v-lese-obeseneho-mladeho-muza', '2022-06-24 19:22:00', '1656105800935', '2022-01-01 00:00:00'),
(67, 'danielstarek@yahoo.com', 'Opitá vodička narazila do policajta. Nehodu chcela riešiť ženským šarmom - TA3', '', 'https://www.ta3.com/clanok/239442/opita-vodicka-narazila-do-policajta-nehodu-chcela-riesit-zenskym-sarmom', '2022-06-24 19:23:00', '1656105826732', '2022-01-01 00:00:00'),
(68, 'danielstarek@yahoo.com', 'TA3', '', 'https://www.ta3.com', '2022-06-24 19:26:00', '1656106012506', '2022-01-01 00:00:00'),
(69, 'danielstarek@yahoo.com', 'Live updates: Supreme Court overturns Roe v. Wade ', '', 'https://edition.cnn.com/politics/live-news/roe-wade-abortion-supreme-court-ruling/index.html', '2022-06-24 19:28:00', '1656106111244', '2022-01-01 00:00:00'),
(70, 'danielstarek@yahoo.com', 'Najvyšší súd USA zrušil právo na interrupciu - TA3', '', 'https://www.ta3.com/clanok/239441/najvyssi-sud-usa-zrusil-pravo-na-interrupciu', '2022-06-24 19:29:00', '1656106168482', '2022-01-01 00:00:00'),
(71, 'danielstarek@yahoo.com', 'Výstraha prvého stupňa! Na strednom Slovensku platí varovanie pred búrkami - TA3', '', 'https://www.ta3.com/clanok/239508/vystraha-prveho-stupna-na-strednom-slovensku-plati-varovanie-pred-burkami', '2022-06-25 14:05:00', '1656173132385', '2022-01-01 00:00:00'),
(72, 'danielstarek@yahoo.com', 'Zásahový tím na Podpoľaní zastrelil medveďa, jednalo sa o problémového jedinca - TA3', 'Zásahový tím pre medveďa hnedého Štátnej ochrany prírody SR v pondelok vo večerných hodinách usmrtil problémového jedinca medveďa hnedého v extraviláne osady Iviny obce Dúbravy v okrese Detva. Medveď oblasť pravidelne navštevoval, spôsoboval škody na', 'https://www.ta3.com/clanok/240364/zasahovy-tim-na-podpolani-zastrelil-medveda-jednalo-sa-o-problemoveho-jedinca', '2022-07-05 17:36:00', '1657049893823', '2022-01-01 00:00:00'),
(73, 'danielstarek@yahoo.com', 'Liberálni demokrati v Japonsku dosiahli výrazné víťazstvo! Hlasovanie sa konalo dva dni po atentáte', 'Japonská vládnuca Liberálnodemokratická strana (LDP) premiéra Fumia Kišidu dosiahla v nedeľňajších voľbách do hornej komory parlamentu výrazne víťazstvo, ktoré krajine zabezpečí politickú stabilitu. Informovala o tom agentúra DPA, od ktorej TASR sprá', 'https://ereport.sk/liberalni-demokrati-v-japonsku-dosiahli-vyrazne-vitazstvo-hlasovanie-sa-konalo-dva-dni-po-atentate', '2022-07-11 08:23:00', '1657535049714', '2022-01-01 00:00:00'),
(74, 'usr', 'A year after Cuba\'s historic protests, the government\'s grip is tighter than ever', 'The largest anti-government protests to take place in Cuba since the 1959 revolution started with a blackout on a boiling hot summer day. After days of power cuts by the government, residents in the small city of San Antonio de los Baños ran out of p', 'https://edition.cnn.com/2022/07/11/americas/cuba-protest-anniversary-intl-latam/index.html', '2022-07-11 17:14:00', '1657566910189', '2022-01-01 00:00:00'),
(75, 'danielstarek@yahoo.com', 'Potrebujeme posilniť tímy na chirurgii a traumatológii, hovorí šéfka spišskonovoveskej nemocnice - TA3', '', 'https://www.ta3.com/clanok/241096/potrebujeme-posilnit-timy-na-chirurgii-a-traumatologii-hovori-sefka-spisskonovoveskej-nemocnice', '2022-07-14 10:03:00', '1657966299732', '2022-01-01 00:00:00'),
(76, 'danielstarek@yahoo.com', 'Polovica Švajčiarov sa chce podľa prieskumu zblížiť s NATO, podpora pre neutralitu klesá - TA3', '', 'https://www.ta3.com/clanok/241108/polovica-svajciarov-sa-chce-podla-prieskumu-zblizit-s-nato-podpora-pre-neutralitu-klesa', '2022-07-14 13:52:00', '1657813981853', '2022-01-01 00:00:00'),
(77, 'danielstarek@yahoo.com', 'Chmelár: Väčšieho demagóga na čele diplomacie Slovensko ešte nemalo- Hlavné správy', '', 'https://www.hlavnespravy.sk/chmelar-vacsieho-demagoga-na-cele-diplomacie-slovensko-este-nemalo/2885370', '2022-07-14 13:53:00', '1657814043397', '2022-01-01 00:00:00'),
(78, 'danielstarek@yahoo.com', 'Kolíková vystúpila v Haagu. Podporila vyšetrovanie vojnových zločinov na Ukrajine', '', 'https://ereport.sk/kolikova-vystupila-v-haagu-podporila-vysetrovanie-vojnovych-zlocinov-na-ukrajine', '2022-07-14 13:54:00', '1657814071483', '2022-01-01 00:00:00'),
(79, 'danielstarek@yahoo.com', 'Zvyšovanie PLATOV zdravotníkov: Dohoda na návrhu ešte nie je! Odborári sú zatiaľ spokojní, máme základné črty', '', 'https://www.topky.sk/cl/10/2346819/Zvysovanie-PLATOV-zdravotnikov--Dohoda-na-navrhu-este-nie-je--Odborari-su-zatial-spokojni--mame-zakladne-crty', '2022-07-14 13:54:00', '1657814099577', '2022-01-01 00:00:00'),
(80, 'danielstarek@yahoo.com', 'Bill Gates vows to drop off world\'s rich list', '', 'https://www.bbc.com/news/business-62162300', '2022-07-14 13:55:00', '1657814143545', '2022-01-01 00:00:00'),
(81, 'danielstarek@yahoo.com', 'Moje Přítelkyně z Itálie Ochutnala Hotovky Těstovin z Tesca!', '', 'https://www.youtube.com/watch', '2022-07-15 16:40:00', '1657910455356', '2022-01-01 00:00:00'),
(82, 'danielstarek@yahoo.com', 'Sri Lanka crisis: How do you fix a broken country?', 'testing', 'https://edition.cnn.com/2022/07/15/asia/sri-lanka-crisis-economy-fix-gotabaya-rajapaksa-saturday-intl-hnk/index.html', '2022-07-16 08:21:00', '1657966895181', '2022-01-01 00:00:00'),
(83, 'danielstarek@yahoo.com', 'Počet nakazených stúpa. Nemocnice však pri tejto vlne nebudú zahltené, myslí si Sabaka - TA3', '', 'https://www.ta3.com/clanok/241490/pocet-nakazenych-stupa-nemocnice-vsak-pri-tejto-vlne-nebudu-zahltene-mysli-si-sabaka', '2022-07-19 13:15:00', '1658243770595', '2022-01-01 00:00:00'),
(84, 'danielstarek@yahoo.com', 'Live updates: Heat wave in UK and Europe ', '', 'https://edition.cnn.com/europe/live-news/uk-europe-heatwave-fires-news-071922-intl-gbr/index.html', '2022-07-19 13:18:00', 'later', '2022-01-01 00:00:00'),
(85, 'danielstarek@yahoo.com', 'Judge orders October trial for lawsuit between Elon Musk and Twitter', 'In an early victory for Twitter, a judge on Tuesday ruled that the company\'s lawsuit against Elon Musk over their $44 billion acquisition agreement should go to a five-day trial in October.', 'https://edition.cnn.com/2022/07/19/tech/twitter-elon-musk-lawsuit-first-hearing/index.html', '2022-07-19 15:31:00', '1658251977632', '2022-01-01 00:00:00'),
(86, 'danielstarek@yahoo.com', 'Judge orders October trial for lawsuit between Elon Musk and Twitter', '', 'https://edition.cnn.com/2022/07/19/tech/twitter-elon-musk-lawsuit-first-hearing/index.html', '2022-07-19 15:32:00', '1658251977632', '2022-01-01 00:00:00'),
(87, 'danielstarek@yahoo.com', 'Karta sa obrátila. Facebook pridal upozornenie k statusu policajne stránky Hoaxy a podvody: Odkaz je od vydavateľa, ktorý je pod kontrolu ruskej vlády - Hlavné správy', 'informovala o odsúdení ru', 'https://www.hlavnespravy.sk/facebook-pridal-upozornenie-k-statusu-policajne-stranky-hoaxy-a-podvody-odkaz-je-od-vydavatela-ktory-je-pod-ciastocnou-alebo-uplnou-kontrolu-ruskej-vlady/2888292', '2022-07-19 15:33:00', '1658252036943', '2022-01-01 00:00:00'),
(88, 'usr', '', '', 'file:///C:/Users/abadh/OneDrive/Desktop/reee.html', '2022-07-20 04:45:00', '1658310322561', '2022-01-01 00:00:00'),
(89, 'usr', 'How to record screen with mic and internal sound with HTML and JavaScript', '', 'https://recordscreenwithhtml.blogspot.com/2022/04/screen-recorder-in-this-blog-i-will.html', '2022-07-20 04:45:00', '1658310376322', '2022-01-01 00:00:00'),
(90, 'usr', 'Lavrov obvinil Ukrajinu z neochoty rokovať', 'Ruský minister zahraničných vecí Sergej Lavrov rokoval v nedeľu v Káhire s egyptským prezidentom Abdalom Fattáhom Sísím a so svojím rezortným kolegom Sámihom Šukrím. Stretol sa aj s generálnym tajomníkom Ligy arabských štátov Ahmadom Abúlom Ghajtom, ', 'https://spravy.pravda.sk/svet/clanok/634778-lavrov-obvinil-ukrajinu-z-neochoty-rokovat', '2022-07-29 06:36:00', '1659083787212', '2022-01-01 00:00:00'),
(91, 'usr', 'Nevhodná otázka pre Rusko. Ukrajinský novinár sa pýtal Lavrova, čo všetko ukradnutého už stihli predať', 'Novinára k slovu nechceli pustiť, otázku si vynútil zvýšením hlasu, riskoval aj narušenie konferencie. Ruský šéf diplomacie odpoveď obrátil na slovný protiútok.', 'https://hnonline.sk/svet/96023883-nevhodna-otazka-pre-rusko-ukrajinsky-novinar-sa-pytal-lavrova-co-vsetko-ukradnuteho-uz-stihli-predat', '2022-07-29 06:40:00', '1659084045565', '2022-01-01 00:00:00'),
(92, 'usr', 'Už nejde jen o Donbas. Rusko chce získat větší část Ukrajiny, než dosud tvrdilo, přiznal Lavrov', 'Geografické cíle Ruska na Ukrajině se změnily, uvedl ve středu ruský ministr zahraničí Sergej Lavrov. Moskvě podle něj nejde jen o Doněckou a Luhanskou oblast, ale také o další území včetně jihu Ukrajiny, napsal list Kommersant s odkazem na rozhovor ', 'https://www.irozhlas.cz/zpravy-svet/rusko-valka-na-ukrajine-lavrov-donbas-vetsi-uzemi_2207201649_har', '2022-07-29 06:42:00', '1659084153010', '2022-01-01 00:00:00'),
(93, 'usr', 'Russia-Ukraine crisis: Lavrov shows diplomatic clout in Africa', 'While Russia is isolated in the West for waging a war in Ukraine, the red carpet was laid out for Foreign Minister Sergei Lavrov during his four-nation tour of Africa.', 'https://www.bbc.com/news/world-africa-62316313', '2022-07-29 06:44:00', '1659084256775', '2022-01-01 00:00:00'),
(94, 'usr', 'Lavrov denigrates West’s stance towards Africa on Ethiopia visit', 'Russian foreign minister was in Addis Ababa wrapping up a four-nation African tour aimed at drumming up support for Moscow.', 'https://www.aljazeera.com/news/2022/7/27/lavrov-denigrates-wests-stance-towards-africa-on-ethiopia-visit', '2022-07-29 06:45:00', '1659084321115', '2022-01-01 00:00:00'),
(95, 'usr', 'Separatists say shelling killed Ukrainian prisoners of war', '', 'https://apnews.com/article/russia-ukraine-donetsk-prisoners-of-war-30e2e205bab0081c576b944baae82a61', '2022-07-29 06:46:00', '1659084392727', '2022-01-01 00:00:00'),
(96, 'usr', 'Russia-Ukraine war latest: what we know on day 155 of the invasion', 'Missiles strike northern regions of Ukraine from Belarus; UK says Ukraine counter-offensive in Kherson gathering momentum', 'https://www.theguardian.com/world/2022/jul/28/russia-ukraine-war-latest-what-we-know-on-day-155-of-the-invasion', '2022-07-29 06:47:00', '1659084474042', '2022-01-01 00:00:00'),
(97, 'usr', 'Russian forces capture Ukraine’s second-biggest power station', 'Ukraine confirms seizure of Vuhlehirska power plant in Donetsk but calls it a ‘tiny tactical advantage’\n\n', 'https://www.theguardian.com/world/2022/jul/28/russian-forces-capture-vuhlehirska-ukraine-second-biggest-power-station-donetsk', '2022-07-29 06:48:00', '1659084548469', '2022-01-01 00:00:00'),
(98, 'usr', 'Ukraine news live: Russia failing in \'many areas\'; Putin \'could move to plan D\'; fears over \'second phase of ground operations\' northeast of Kyiv', 'US: 75,000 Russians killed or wounded in Ukraine', 'https://news.sky.com/story/ukraine-news-live-putin-looting-steel-bound-for-uk-major-deal-to-relieve-food-crisis-to-be-signed-russian-forces-increasing-missile-use-12541713', '2022-07-29 06:49:00', '1659084606053', '2022-01-01 00:00:00'),
(99, 'usr', 'Krajniak z dovolenky: Nová doba, turisti majú v katedrále prednosť pred kresťanmi- Hlavné správy', 'Minister práce, sociálnych vecí a rodiny SR Milan Krajniak (Sme rodina) sa aktuálne nachádza s rodinou na dovolenke v Taliansku. Na sociálnej sieti zverejnil status, v ktorom upozorňuje, že v katedrále majú turisti pred kresťanmi\n\n', 'https://www.hlavnespravy.sk/krajniak-z-dovolenky-nova-doba-turisti-maju-v-katedrale-prednost-pred-krestanmi/2894692', '2022-07-29 20:03:00', '1659132594242', '2022-07-29 22:03:00'),
(100, 'usr', 'Sulík mešká s dohodou. Regulátor varuje, že domácnostiam na Slovensku vyskočia účty za energie o 1800 eur', 'Chýbajú pravidlá na implementáciu memoranda o porozumení so spoločnosťou Slovenské elektrárne (SE).', 'https://www.infovojna.bz/article/sulik-meska-s-dohodou-regulator-varuje-ze-domacnostiam-na-slovensku-vyskocia-ucty-za-energie-o-1800-eur', '2022-08-02 06:37:00', '1659429463658', '2022-08-02 08:37:00'),
(101, 'usr', '', '', 'https://www.youtube.com', '2022-08-02 04:29:00', '1659432600883', '2022-08-02 09:29:00'),
(102, 'usr', '', '', 'http://beta.saveyournews.com/user', '2022-08-02 04:31:00', 'later', '2022-01-01 00:00:00'),
(103, 'usr', 'Build a Video, Audio + Screen Recorder Web App with JavaScript', '', 'https://javascript.plainenglish.io/build-audio-video-and-screen-recorder-for-web-with-javascript-583584dd3c75', '2022-08-02 04:32:00', '1659432776968', '2022-08-02 09:32:00'),
(104, 'usr', 'Otvorený list bývalého trojnásobného premiéra Roberta Fica prokurátorovi Lipšicovej špeciálnej prokuratúry - Matúšovi Harkabusovi, ktorý dozoruje politický proces „Súmrak“', '„Plníte politický pokyn. Zabezpečiť podanie obžaloby súčasne s rozhodnutím o sťažnosti proti uzneseniu obvinenia a tak zmariť právo obvinených žiadať preskúmanie zákonnosti právoplatných rozhodnutí v prípravnom konaní. Postup zodpovedajúci charakteru', 'https://www.infovojna.bz/article/otvoreny-list-byvaleho-trojnasobneho-premiera-roberta-fica-prokuratorovi-lipsicovej-specialnej-prokuratury-matusovi-harkabusovi-ktory-dozoruje-politicky-proces-sumrak', '2022-08-02 11:12:00', '1659445971184', '2022-08-02 13:12:00'),
(105, 'usr', 'Medium – Where good ideas find you.', '', 'https://medium.com', '2022-08-03 00:06:00', '1659503310279', '2022-08-03 05:07:00'),
(106, 'usr', 'MediaStream Recording API - Web APIs | MDN', '', 'https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API', '2022-08-03 00:09:00', '1659503381224', '2022-08-03 05:09:00'),
(107, 'usr', 'MediaStream - Web APIs | MDN', '', 'https://developer.mozilla.org/en-US/docs/Web/API/MediaStream', '2022-08-03 00:11:00', '1659503494466', '2022-08-03 05:11:00'),
(108, 'danielstarek@yahoo.com', '', '', 'http://www.example.com', '2022-08-17 00:55:00', '1660676948021', '2022-01-01 00:00:00'),
(109, 'danielstarek@yahoo.com', '', '', 'http://www.example.com/', '2022-08-17 23:58:00', 'later', '2022-01-01 00:00:00'),
(110, 'danielstarek@yahoo.com', '', '', 'https://www.shmu.sk/sk', '2022-08-19 10:43:00', '1660913048598', '2022-01-01 00:00:00'),
(111, 'danielstarek@yahoo.com', 'Premiér navrhne v sobotu zmenu koaličnej zmluvy. Toto očakáva od SaS - Hlavné správy', '', 'https://www.hlavnespravy.sk/premier-navrhne-v-sobotu-zmenu-koalicnej-zmluvy-toto-ocakava-od-sas/2907492', '2022-08-19 10:46:00', 'later', '2022-01-01 00:00:00'),
(112, 'danielstarek@yahoo.com', 'Ukrajina svoju veľkú protiofenzívu telegrafovala už niekoľko mesiacov. Tak kde je? - pýta sa Politico - Hlavné správy', 'Ukrajina už dva mesiace signalizuje svoj zámer dobyť späť južné mesto Cherson, čo sa označuje za veľkú protiofenzívu a moment, keď Kyjev obráti situáciu proti Rusku. Na situáciu reaguje v komentári Politico, ktorý vám prinášame ', 'https://www.hlavnespravy.sk/ukrajina-svoju-velku-protiofenzivu-telegrafovala-uz-niekolko-mesiacov-tak-kde-je-pyta-sa-politico/2907442', '2022-08-19 17:06:00', '1660936023616', '2022-01-01 00:00:00'),
(113, 'danielstarek@yahoo.com', 'Hra s ohněm na Ukrajině: Americký politolog se připojil ke Kissingerovi a varuje před hrozbou katastrofální eskalace zástupné války na Ukrajině, že se do bojů zapojí americká armáda napřímo, protože americký režim spojil svůj osud s vítězstvím Ukrajiny nad Ruskem! ', '', 'https://www.infovojna.bz/article/hra-s-ohnem-na-ukrajine-americky-politolog-se-pripojil-ke-kissingerovi-a-varuje-pred-hrozbou-katastrofalni-eskalace-zastupne-valky-na-ukrajine-ze-se-do-boj-zapoji-americka-armada-naprimo-protoze-americky-rezim-spojil-svj-osud-s-vitezstvim-ukrajiny-na', '2022-08-19 17:17:00', '1660936672986', '2022-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_connections`
--

DROP TABLE IF EXISTS `tbl_connections`;
CREATE TABLE IF NOT EXISTS `tbl_connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `text1` varchar(7000) NOT NULL,
  `text2` varchar(7000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_connections`
--

INSERT INTO `tbl_connections` (`id`, `user`, `url`, `text1`, `text2`) VALUES
(1, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Extensions', 'Deleting'),
(2, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Extensions', 'Add'),
(3, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Chrome', 'Extensions'),
(4, 'usr', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', 'proruských Ukrajinců', 'bezpečnost'),
(5, 'adxalert@gmx.com', 'https://www.ceskenoviny.cz/zpravy/ceny-pohonnych-hmot-v-cr-nadale-rostou-nafta-zdrazuje-rychleji/2173354', 'Štěpán Křeček', 'BH Securities'),
(6, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'UnionPay', 'čínsky platobný systém'),
(7, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'Mastercard', 'nebudú od štvrtka fungovať'),
(8, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'Visa', 'nebudú od štvrtka fungovať'),
(9, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', 'Odessa', '2. mája 2014'),
(10, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', 'Radikáli', 'zapálili stanový tábor'),
(11, 'danielstarek@yahoo.com', 'https://spravy.pravda.sk/svet/clanok/625186-online-agonia-azovstalu-starosta-hovori-o-hodinach-zivota', 'ruského ministerstva obrany', 'Olaf Scholz'),
(12, 'danielstarek@yahoo.com', 'https://hnonline.sk/svet/23407639-rusko-mava-tajnym-rozkazom-kyjeva-napadnut-donbas-ziada-vysvetlit-biologicke-zbrane', 'Donbas', 'Kyjev'),
(13, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/moskve-nepodarilo-obklucit-kyjev-podla-britov-zrejme-sustredi-donbas', 'Kyjev', 'Donbas'),
(14, 'usr', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', 'Olaf Scholz', 'Dmytro Kuleba'),
(15, 'danielstarek@yahoo.com', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', 'Olaf Scholz', 'Dmytro Kuleba'),
(16, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'kapacita', 'denně'),
(17, 'danielstarek@yahoo.com', 'https://www.infovojna.bz/article/protiruske-sankcie-zmenia-existujuci-svetovy-poriadok-samovrazedne-ekonomicke-sankcie-zapadu-sposobia-v-ich-krajinach-pokracovanie-narastu-cien-energii-a-hladomor-dojde-k-rozpadu-americko-centrickeho-sveta-a-vytvori-sa-nova-bezpecnostna-architektura-', 'dodávateľské reťazce', 'Rada Európy');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recordings`
--

DROP TABLE IF EXISTS `tbl_recordings`;
CREATE TABLE IF NOT EXISTS `tbl_recordings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `date` datetime NOT NULL,
  `pageDate` datetime NOT NULL,
  `filename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_recordings`
--

INSERT INTO `tbl_recordings` (`id`, `user`, `title`, `url`, `description`, `date`, `pageDate`, `filename`) VALUES
(1, 'danielstarek@yahoo.com', '', 'https://spyder.plmcd.com/phpmyadmin/sql.php', '', '2022-07-27 18:07:00', '2022-07-27 18:07:00', '06363e88ab48.wav'),
(2, 'danielstarek@yahoo.com', '', 'https://spyder.plmcd.com/phpmyadmin/sql.php', 'abc', '2022-07-27 18:46:00', '2022-07-27 18:46:00', '76fbebb3741f.wav'),
(3, 'danielstarek@yahoo.com', '', 'https://www.google.com/webhp', '', '2022-07-27 18:47:00', '2022-07-27 18:47:00', '5edc1bf1b15d.wav'),
(5, 'danielstarek@yahoo.com', '', 'https://www.youtube.com/watch', 'DR DISRESPECT - GAMING WITH RANDOMS', '2022-07-27 21:28:00', '2022-07-27 21:28:00', '6470614bb608.wav'),
(6, 'danielstarek@yahoo.com', '', 'https://www.youtube.com/watch', 'Testing the Pipe Gun That Killed the Japanese Prime Minister', '2022-07-27 21:31:00', '2022-07-27 21:31:00', '15ea02c207c4.wav'),
(7, 'danielstarek@yahoo.com', '', 'https://www.youtube.com/watch', 'Testing the Pipe Gun That Killed the Japanese Prime Minister', '2022-07-27 21:31:00', '2022-07-27 21:31:00', '16c94bfa72af.wav'),
(9, 'danielstarek@yahoo.com', '', 'http://www.example.com/', '', '2022-08-16 19:06:00', '2022-08-16 19:06:00', '1660676787097.wav'),
(10, 'danielstarek@yahoo.com', '', 'http://www.example.com/', '', '2022-08-16 19:06:00', '2022-08-16 19:06:00', '1660676787238.wav'),
(11, 'danielstarek@yahoo.com', '', 'https://www.youtube.com/watch?v=BYApOQprlWg', 'Filip Turek, ktorého zbierka áut patrí k najvzácnejším na svete, nám poodhalil zákulisie svojich áut\n', '2022-08-19 19:08:00', '2022-08-19 19:08:00', '1660936109645.wav'),
(12, 'danielstarek@yahoo.com', '', 'https://www.youtube.com/watch?v=BYApOQprlWg', 'Filip Turek, ktorého zbierka áut patrí k najvzácnejším na svete, nám poodhalil zákulisie svojich áut\n', '2022-08-19 19:08:00', '2022-08-19 19:08:00', '1660936109691.wav');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_selections`
--

DROP TABLE IF EXISTS `tbl_selections`;
CREATE TABLE IF NOT EXISTS `tbl_selections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `selection` varchar(10000) NOT NULL,
  `percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_selections`
--

INSERT INTO `tbl_selections` (`id`, `user`, `url`, `selection`, `percentage`) VALUES
(1, 'usr', 'https://spyder.plmcd.com/phpmyadmin/sql.php', 'MySQL', 2),
(2, 'usr', 'http://example1.com', 'tag1', 2),
(5, 'usr', 'http://example2.com', 'tag2', 2),
(7, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Chrome', 80),
(8, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Web Store', 70),
(9, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Extensions', 90),
(10, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Add', 85),
(11, 'usr', 'https://www.greengeeks.com/tutorials/add-extensions-in-google-chrome', 'Deleting', 85),
(12, 'usr', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', 'Volodymyr Zelenskyj', 80),
(13, 'usr', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', 'Lavrov', 80),
(14, 'usr', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', 'terorizování civilistů', 75),
(15, 'usr', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', 'proruských Ukrajinců', 80),
(16, 'usr', 'https://www.infovojna.bz/article/lavrov-co-na-tom-ze-zelenskyj-je-zid-tato-skutecnost-nepopira-nacisticke-prvky-na-ukrajine-hitler-mel-take-zidovskou-krev', 'bezpečnost', 85),
(17, 'adxalert@gmx.com', 'https://www.ceskenoviny.cz/zpravy/ceny-pohonnych-hmot-v-cr-nadale-rostou-nafta-zdrazuje-rychleji/2173354', 'Nejdražší nafta', 80),
(18, 'adxalert@gmx.com', 'https://www.ceskenoviny.cz/zpravy/ceny-pohonnych-hmot-v-cr-nadale-rostou-nafta-zdrazuje-rychleji/2173354', 'WTI', 85),
(19, 'adxalert@gmx.com', 'https://www.ceskenoviny.cz/zpravy/ceny-pohonnych-hmot-v-cr-nadale-rostou-nafta-zdrazuje-rychleji/2173354', 'Štěpán Křeček', 80),
(20, 'adxalert@gmx.com', 'https://www.ceskenoviny.cz/zpravy/ceny-pohonnych-hmot-v-cr-nadale-rostou-nafta-zdrazuje-rychleji/2173354', 'BH Securities', 90),
(21, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'UnionPay ', 80),
(22, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'čínsky platobný systém', 85),
(23, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'Visa ', 80),
(24, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'Mastercard', 80),
(25, 'adxalert@gmx.com', 'https://www.trend.sk/spravy/ruske-banky-kvoli-odchodu-visy-mastercardu-obracaju-cinskemu-systemu', 'nebudú od štvrtka fungovať', 80),
(26, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', 'Odessa ', 80),
(27, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', '2. mája 2014', 80),
(28, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', 'Radikáli ', 80),
(29, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', 'členovia Pravého sektora', 80),
(30, 'danielstarek@yahoo.com', 'http://www.nazorobcana.sk/novinka-sprava-aktualita/zahranicie/clanok-1964/odesa-2-maj-2014-memento-fasizmu', 'zapálili stanový tábor', 80),
(31, 'danielstarek@yahoo.com', 'https://spravy.pravda.sk/svet/clanok/625186-online-agonia-azovstalu-starosta-hovori-o-hodinach-zivota', 'Doneckej ', 80),
(32, 'danielstarek@yahoo.com', 'https://spravy.pravda.sk/svet/clanok/625186-online-agonia-azovstalu-starosta-hovori-o-hodinach-zivota', 'Dmytro Kuleba', 75),
(33, 'danielstarek@yahoo.com', 'https://spravy.pravda.sk/svet/clanok/625186-online-agonia-azovstalu-starosta-hovori-o-hodinach-zivota', 'ruského ministerstva obrany', 75),
(34, 'danielstarek@yahoo.com', 'https://spravy.pravda.sk/svet/clanok/625186-online-agonia-azovstalu-starosta-hovori-o-hodinach-zivota', 'Olaf Scholz', 70),
(35, 'adxalert@gmx.com', 'https://www.bbc.com/news/world-europe-61327638', 'Russia', 2),
(36, 'adxalert@gmx.com', 'https://www.reuters.com/world/europe/ukraine-says-it-is-ready-if-belarus-joins-russian-war-effort-2022-05-04', 'Russia', 2),
(37, 'usr', 'https://www.bbc.com/news/world-europe-61327638', 'Russia', 2),
(38, 'usr', 'https://www.bbc.com/news/world-europe-61327638', 'Russia', 2),
(39, 'usr', 'https://www.bbc.com/news/world-europe-61327638', 'Russia', 5),
(40, 'usr', 'https://www.reuters.com/world/europe/ukraine-says-it-is-ready-if-belarus-joins-russian-war-effort-2022-05-04', 'Russia', 2),
(41, 'usr', 'https://www.reuters.com/world/europe/russia2', 'Russia2', 2),
(42, 'usr', 'https://www.reuters.com/world/europe/us-intelligence-helping-ukraine-kill-russian-generals-ny-times-2022-05-05', 'Russia', 2),
(43, 'usr', 'https://www.reuters.com/world/europe/berlin-says-it-will-work-eufor-bosnia-extension-amid-russia-concerns-2022-05-04', 'Russia', 2),
(44, 'danielstarek@yahoo.com', 'https://hnonline.sk/svet/23407639-rusko-mava-tajnym-rozkazom-kyjeva-napadnut-donbas-ziada-vysvetlit-biologicke-zbrane', 'Donbas', 80),
(45, 'danielstarek@yahoo.com', 'https://hnonline.sk/svet/23407639-rusko-mava-tajnym-rozkazom-kyjeva-napadnut-donbas-ziada-vysvetlit-biologicke-zbrane', 'Kyjev', 75),
(46, 'danielstarek@yahoo.com', 'https://hnonline.sk/svet/23407639-rusko-mava-tajnym-rozkazom-kyjeva-napadnut-donbas-ziada-vysvetlit-biologicke-zbrane', 'Ruské ministerstvo zahraničia', 70),
(47, 'danielstarek@yahoo.com', 'https://hnonline.sk/svet/23407639-rusko-mava-tajnym-rozkazom-kyjeva-napadnut-donbas-ziada-vysvetlit-biologicke-zbrane', 'Zacharovová', 80),
(48, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/moskve-nepodarilo-obklucit-kyjev-podla-britov-zrejme-sustredi-donbas', 'Kyjev', 75),
(49, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/moskve-nepodarilo-obklucit-kyjev-podla-britov-zrejme-sustredi-donbas', 'Donbas', 85),
(50, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/moskve-nepodarilo-obklucit-kyjev-podla-britov-zrejme-sustredi-donbas', 'Rusko ', 65),
(51, 'usr', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', 'Olaf Scholz', 80),
(52, 'usr', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', 'Dmytro Kuleba', 75),
(53, 'danielstarek@yahoo.com', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', 'Olaf Scholz', 75),
(54, 'danielstarek@yahoo.com', 'https://www.dw.com/en/olaf-scholz-ukraine-wont-accept-russian-dictatorship/a-61724145', 'Dmytro Kuleba', 70),
(55, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/scholz-nemecko-musi-ukrajine-pomoct-vojny-ale-nevstupi', 'Scholz', 60),
(56, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/scholz-nemecko-pomoze-cesku-nahradit-tazku-techniku-odoslanu-ukrajinu', 'Olaf Scholz', 80),
(57, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'Sochranovka', 80),
(58, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'Ukrajina ', 80),
(59, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'přeruší', 80),
(60, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'plynu', 80),
(61, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'kapacita ', 80),
(62, 'danielstarek@yahoo.com', 'https://ct24.ceskatelevize.cz/ekonomika/3487002-ukrajina-prerusi-tranzit-ruskeho-plynu-do-evropy-pres-stanici-sochranovka', 'denně', 80),
(63, 'danielstarek@yahoo.com', 'https://www.infovojna.bz/article/protiruske-sankcie-zmenia-existujuci-svetovy-poriadok-samovrazedne-ekonomicke-sankcie-zapadu-sposobia-v-ich-krajinach-pokracovanie-narastu-cien-energii-a-hladomor-dojde-k-rozpadu-americko-centrickeho-sveta-a-vytvori-sa-nova-bezpecnostna-architektura-', 'Medvedev ', 80),
(64, 'danielstarek@yahoo.com', 'https://www.infovojna.bz/article/protiruske-sankcie-zmenia-existujuci-svetovy-poriadok-samovrazedne-ekonomicke-sankcie-zapadu-sposobia-v-ich-krajinach-pokracovanie-narastu-cien-energii-a-hladomor-dojde-k-rozpadu-americko-centrickeho-sveta-a-vytvori-sa-nova-bezpecnostna-architektura-', 'dodávateľské reťazce', 75),
(65, 'danielstarek@yahoo.com', 'https://www.infovojna.bz/article/protiruske-sankcie-zmenia-existujuci-svetovy-poriadok-samovrazedne-ekonomicke-sankcie-zapadu-sposobia-v-ich-krajinach-pokracovanie-narastu-cien-energii-a-hladomor-dojde-k-rozpadu-americko-centrickeho-sveta-a-vytvori-sa-nova-bezpecnostna-architektura-', 'Rada Európy', 85),
(66, 'usr', 'https://www.trend.sk/spravy/unian-boje-azovstal-hrozia-ekologickou-katastrofou-azovskom-mori', 'Pokračujúce útoky na oceliareň Azovstaľ by mohli viesť k ekologickej katastrofe', 25),
(67, 'danielstarek@yahoo.com', 'https://www.trend.sk/nazory-a-komentare/vysoka-inflacia-nici-vychodnu-europu-moze-to-putin-alebo-chybna-politika-ecb', 'Francúzsko', 80),
(68, 'danielstarek@yahoo.com', 'https://www.trend.sk/nazory-a-komentare/vysoka-inflacia-nici-vychodnu-europu-moze-to-putin-alebo-chybna-politika-ecb', 'Turecko', 58),
(69, 'danielstarek@yahoo.com', 'https://www.trend.sk/nazory-a-komentare/vysoka-inflacia-nici-vychodnu-europu-moze-to-putin-alebo-chybna-politika-ecb', 'Česka', 65),
(70, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/rusky-velvyslanec-tvrdi-nema-nudzu-pracovne-stretnutia-aj-napriek-odsudeniu-ruska', 'veľvyslanec', 80),
(71, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/rusky-velvyslanec-tvrdi-nema-nudzu-pracovne-stretnutia-aj-napriek-odsudeniu-ruska', 'ľudmi', 75),
(72, 'danielstarek@yahoo.com', 'https://www.ta3.com/clanok/237055/usa-zaviedli-sankcie-voci-sieti-paserakov-s-prepojeniami-na-iranske-teroristicke-skupiny-a-rusku-vladu', 'skupiny', 85),
(73, 'danielstarek@yahoo.com', 'https://www.ta3.com/clanok/237055/usa-zaviedli-sankcie-voci-sieti-paserakov-s-prepojeniami-na-iranske-teroristicke-skupiny-a-rusku-vladu', 'Antony Blinken', 85),
(74, 'usr', 'https://www.aktuality.sk/clanok/s3AMIPr/matovic-sa-nemusi-bat-caputovej-veta-ovela-vacsim-problemom-bude-ak-sa-obrati-na-ustavny-sud', 'Matovič ', 80),
(75, 'usr', 'https://www.aktuality.sk/clanok/s3AMIPr/matovic-sa-nemusi-bat-caputovej-veta-ovela-vacsim-problemom-bude-ak-sa-obrati-na-ustavny-sud', 'Čaputová', 75),
(76, 'usr', 'https://dennikn.sk/2318300/rok-v-konflikte-ako-sa-matovicova-vlada-prepracovala-od-nastupu-ku-krize', 'Matovičova', 75),
(77, 'usr', 'https://www.economist.com/europe/2022/05/31/olaf-scholzs-dithering-is-damaging-germanys-international-image', 'Olaf Scholz’s', 75),
(78, 'danielstarek@yahoo.com', 'https://www.trend.sk/trend-archiv/mlady-farmar-vranova-meni-pohlad-chov-dobytka', 'Prvú kravu kúpil synovi. Farma Krava&Company opiera podnikanie o otvorené ekologické poľnohospodárstvo', 50),
(79, 'danielstarek@yahoo.com', 'https://www.trend.sk/trend-archiv/mlady-farmar-vranova-meni-pohlad-chov-dobytka', 'Prvú kravu kúpil synovi. Farma Krava&Company opiera podnikanie o otvorené ekologické poľnohospodárstvo', 50),
(80, 'danielstarek@yahoo.com', 'https://www.trend.sk/trend-archiv/mlady-farmar-vranova-meni-pohlad-chov-dobytka', 'Prvú kravu kúpil synovi. Farma Krava&Company opiera podnikanie o otvorené ekologické poľnohospodárstvo', 50),
(81, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/aj-spotrebne-dane-maju-svoj-limit-ich-prestrelenie-podporuje-nelegalny-trh-ukazalo-francuzsko', 'Francúzsko', 75),
(82, 'danielstarek@yahoo.com', 'https://www.trend.sk/spravy/aj-spotrebne-dane-maju-svoj-limit-ich-prestrelenie-podporuje-nelegalny-trh-ukazalo-francuzsko', '40 percen', 50),
(83, 'danielstarek@yahoo.com', 'https://www.ta3.com/clanok/240364/zasahovy-tim-na-podpolani-zastrelil-medveda-jednalo-sa-o-problemoveho-jedinca', 'medveďa', 80),
(84, 'danielstarek@yahoo.com', 'https://www.ta3.com/clanok/240364/zasahovy-tim-na-podpolani-zastrelil-medveda-jednalo-sa-o-problemoveho-jedinca', 'hlásenia ', 40),
(85, 'danielstarek@yahoo.com', 'https://ereport.sk/liberalni-demokrati-v-japonsku-dosiahli-vyrazne-vitazstvo-hlasovanie-sa-konalo-dva-dni-po-atentate', 'Šinzóa Abeho', 50),
(86, 'danielstarek@yahoo.com', 'https://ereport.sk/liberalni-demokrati-v-japonsku-dosiahli-vyrazne-vitazstvo-hlasovanie-sa-konalo-dva-dni-po-atentate', 'Kišida', 80),
(87, 'usr', 'https://edition.cnn.com/2022/07/11/americas/cuba-protest-anniversary-intl-latam/index.html', 'San Antonio', 80),
(88, 'usr', 'https://edition.cnn.com/2022/07/11/americas/cuba-protest-anniversary-intl-latam/index.html', 'July 11, 2021', 60),
(89, 'danielstarek@yahoo.com', 'https://edition.cnn.com/2022/07/19/tech/twitter-elon-musk-lawsuit-first-hearing/index.html', 'Musk', 80),
(90, 'danielstarek@yahoo.com', 'https://edition.cnn.com/2022/07/19/tech/twitter-elon-musk-lawsuit-first-hearing/index.html', 'Twitter ', 50),
(91, 'danielstarek@yahoo.com', 'https://edition.cnn.com/2022/07/19/tech/twitter-elon-musk-lawsuit-first-hearing/index.html', 'Elon Musk', 80),
(92, 'usr', 'https://spravy.pravda.sk/svet/clanok/634778-lavrov-obvinil-ukrajinu-z-neochoty-rokovat', 'Sergej Lavrov', 80),
(93, 'usr', 'https://spravy.pravda.sk/svet/clanok/634778-lavrov-obvinil-ukrajinu-z-neochoty-rokovat', 'Rusko ', 75),
(94, 'usr', 'https://spravy.pravda.sk/svet/clanok/634778-lavrov-obvinil-ukrajinu-z-neochoty-rokovat', 'Egypt však tiež patrí medzi najväčších dovozcov pšenice na svete, najmä z Ruska a Ukrajiny.', 80),
(95, 'usr', 'https://hnonline.sk/svet/96023883-nevhodna-otazka-pre-rusko-ukrajinsky-novinar-sa-pytal-lavrova-co-vsetko-ukradnuteho-uz-stihli-predat', 'Ukrajinský novinár', 80),
(96, 'usr', 'https://hnonline.sk/svet/96023883-nevhodna-otazka-pre-rusko-ukrajinsky-novinar-sa-pytal-lavrova-co-vsetko-ukradnuteho-uz-stihli-predat', 'Lavrov', 80),
(97, 'usr', 'https://hnonline.sk/svet/96023883-nevhodna-otazka-pre-rusko-ukrajinsky-novinar-sa-pytal-lavrova-co-vsetko-ukradnuteho-uz-stihli-predat', 'Ukrajinský veľvyslanec v Ankare v piatok obvinil Rusko z krádeží ukrajinského obilia a jeho exportu najmä do Turecka.', 75),
(98, 'usr', 'https://www.irozhlas.cz/zpravy-svet/rusko-valka-na-ukrajine-lavrov-donbas-vetsi-uzemi_2207201649_har', 'Rusko ', 90),
(99, 'usr', 'https://www.irozhlas.cz/zpravy-svet/rusko-valka-na-ukrajine-lavrov-donbas-vetsi-uzemi_2207201649_har', 'Ukrajinu ', 90),
(100, 'usr', 'https://www.irozhlas.cz/zpravy-svet/rusko-valka-na-ukrajine-lavrov-donbas-vetsi-uzemi_2207201649_har', 'Lavrova ', 80),
(101, 'usr', 'https://www.bbc.com/news/world-africa-62316313', 'Lavrov ', 90),
(102, 'usr', 'https://www.bbc.com/news/world-africa-62316313', 'Ukraine', 80),
(103, 'usr', 'https://www.bbc.com/news/world-africa-62316313', 'At a press conference with Mr Lavrov, Uganda\'s President Yoweri Museven', 90),
(104, 'usr', 'https://www.aljazeera.com/news/2022/7/27/lavrov-denigrates-wests-stance-towards-africa-on-ethiopia-visit', 'Lavrov ', 90),
(105, 'usr', 'https://www.aljazeera.com/news/2022/7/27/lavrov-denigrates-wests-stance-towards-africa-on-ethiopia-visit', 'Ethiopia', 90),
(106, 'usr', 'https://www.aljazeera.com/news/2022/7/27/lavrov-denigrates-wests-stance-towards-africa-on-ethiopia-visit', 'African nations', 70),
(107, 'usr', 'https://apnews.com/article/russia-ukraine-donetsk-prisoners-of-war-30e2e205bab0081c576b944baae82a61', 'Ukraine ', 80),
(108, 'usr', 'https://apnews.com/article/russia-ukraine-donetsk-prisoners-of-war-30e2e205bab0081c576b944baae82a61', 'Mariupol', 80),
(109, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russia-ukraine-war-latest-what-we-know-on-day-155-of-the-invasion', 'Mykolaiv', 80),
(110, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russia-ukraine-war-latest-what-we-know-on-day-155-of-the-invasion', 'Volodymyr Zelenskiy', 80),
(111, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russia-ukraine-war-latest-what-we-know-on-day-155-of-the-invasion', 'Belarus', 80),
(112, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russia-ukraine-war-latest-what-we-know-on-day-155-of-the-invasion', 'Ukraine’s ', 75),
(113, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russian-forces-capture-vuhlehirska-ukraine-second-biggest-power-station-donetsk', 'Ukraine’s ', 80),
(114, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russian-forces-capture-vuhlehirska-ukraine-second-biggest-power-station-donetsk', 'Russian forces', 85),
(115, 'usr', 'https://www.theguardian.com/world/2022/jul/28/russian-forces-capture-vuhlehirska-ukraine-second-biggest-power-station-donetsk', ' Antony Blinken', 75),
(116, 'usr', 'https://news.sky.com/story/ukraine-news-live-putin-looting-steel-bound-for-uk-major-deal-to-relieve-food-crisis-to-be-signed-russian-forces-increasing-missile-use-12541713', 'Ukraine', 80),
(117, 'usr', 'https://news.sky.com/story/ukraine-news-live-putin-looting-steel-bound-for-uk-major-deal-to-relieve-food-crisis-to-be-signed-russian-forces-increasing-missile-use-12541713', 'Russian ', 75),
(118, 'usr', 'https://www.infovojna.bz/article/sulik-meska-s-dohodou-regulator-varuje-ze-domacnostiam-na-slovensku-vyskocia-ucty-za-energie-o-1800-eur', 'Andrej Juris', 70),
(119, 'usr', 'https://www.infovojna.bz/article/otvoreny-list-byvaleho-trojnasobneho-premiera-roberta-fica-prokuratorovi-lipsicovej-specialnej-prokuratury-matusovi-harkabusovi-ktory-dozoruje-politicky-proces-sumrak', 'Robert Fico', 85);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_topic`
--

DROP TABLE IF EXISTS `tbl_topic`;
CREATE TABLE IF NOT EXISTS `tbl_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `url` varchar(2000) NOT NULL,
  `date` datetime NOT NULL,
  `capture` varchar(15) NOT NULL,
  `tblName` varchar(100) CHARACTER SET utf8 NOT NULL,
  `Topic1` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Topic2` varchar(254) CHARACTER SET utf8 NOT NULL,
  `Topic3` varchar(254) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `user`, `password`, `email`) VALUES
(1, 'usr', '789', NULL),
(2, 'usr2', '123', NULL),
(3, 'usr3', '456', NULL),
(4, 'adxalert@gmx.com', 'La1976St', NULL),
(5, 'danielstarek@yahoo.com', '202cb962ac59075b964b07152d234b70', NULL),
(6, 'usr4', '1234', NULL),
(7, 'user5', '123', 'user5@mail.com'),
(8, 'user6', '123', 'user6@mail.com'),
(9, 'user7', '123', 'abc');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_videos`
--

DROP TABLE IF EXISTS `tbl_videos`;
CREATE TABLE IF NOT EXISTS `tbl_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `title` varchar(2000) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `date` datetime NOT NULL,
  `filename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_videos`
--

INSERT INTO `tbl_videos` (`id`, `user`, `title`, `description`, `date`, `filename`) VALUES
(1, 'danielstarek@yahoo.com', 'title3', 'desc3', '2022-08-15 10:30:00', '1660559404267.mp4'),
(2, 'danielstarek@yahoo.com', 'reuters', 'news', '2022-08-15 11:06:00', '1660561583557.mp4'),
(3, 'usr', 'Republicans pressure Garland as intrigue deepens over search of Trump home', 'The FBI\'s stunning search of ex-President Donald Trump\'s home triggered a legal and political earthquake whose aftershocks are only widening a week on, with key questions that will shape the nation\'s future still clouded in mystery.', '2022-08-15 11:51:00', '1660564300799.mp4'),
(4, 'usr', 'Republicans pressure Garland as intrigue deepens over search of Trump home', 'The FBI\'s stunning search of ex-President Donald Trump\'s home triggered a legal and political earthquake whose aftershocks are only widening a week on, with key questions that will shape the nation\'s future still clouded in mystery.', '2022-08-15 11:54:00', '1660564479668.mp4'),
(5, 'usr', 'Republicans pressure Garland as intrigue deepens over search of Trump home', 'The FBI\'s stunning search of ex-President Donald Trump\'s home triggered a legal and political earthquake whose aftershocks are only widening a week on, with key questions that will shape the nation\'s future still clouded in mystery.', '2022-08-15 12:06:00', '1660565195434.mp4'),
(6, 'usr', 'Republicans pressure Garland as intrigue deepens over search of Trump home', '', '2022-08-15 12:09:00', '1660565344323.mp4'),
(7, 'usr', 'Republicans pressure Garland as intrigue deepens over search of Trump home', '', '2022-08-15 12:12:00', '1660565546824.mp4'),
(8, 'danielstarek@yahoo.com', 'Republicans pressure Garland as intrigue deepens over search of Trump home', 'The FBI\'s stunning search of ex-President Donald Trump\'s home triggered a legal and political earthquake whose aftershocks are only widening a week on, with key questions that will shape the nation\'s future still clouded in mystery.', '2022-08-15 12:19:00', '1660565965032.mp4'),
(9, 'danielstarek@yahoo.com', 'Gentle healing music for health and calming the nervous system, deep relaxation #8', '', '2022-08-15 12:42:00', '1660567331827.mp4'),
(10, 'usr', '', '', '2022-08-15 13:02:00', '1660568566996.mp4'),
(11, 'usr', '', '', '2022-08-15 13:06:00', '1660568790639.mp4'),
(12, 'usr', '', '', '2022-08-15 13:10:00', '1660569014507.mp4'),
(13, 'danielstarek@yahoo.com', 'Garland as intrigue deepens over search of Trump home', 'ex-President Donald Trump\'s home triggered a legal and political earthquake whose aftershocks are only widening a week on, with key questions that will shape the nation\'s future still clouded in mystery.', '2022-08-15 13:25:00', '1660569903051.mp4'),
(14, 'usr', 'hello', 'hy', '2022-08-15 14:51:00', '1660575082504.mp4'),
(15, 'usr', 'kklklklkl', 'hy', '2022-08-15 14:54:00', '1660575289404.mp4'),
(16, 'danielstarek@yahoo.com', 'title5', 'desc5', '2022-08-16 12:24:00', '1660652687761.mp4'),
(17, 'danielstarek@yahoo.com', 'title cropped', 'desc cropped', '2022-08-16 12:25:00', '1660652730192.mp4'),
(18, 'danielstarek@yahoo.com', 'title cropped', 'desc cropped', '2022-08-16 12:25:00', '1660652730502.mp4'),
(19, 'danielstarek@yahoo.com', 'title-c1', 'desc-c1', '2022-08-16 12:27:00', '1660652870579.mp4'),
(20, 'danielstarek@yahoo.com', 'Cohen predicts Trump\'s next move following Mar-a-Lago search', 'Micheal Cohen, Donald Trump\'s former personal attorney, tells CNN\'s Don Lemon what he predicts the former president\'s next move will be following the FBI search at Mar-a-Lago.', '2022-08-16 14:52:00', '1660661557155.mp4'),
(21, 'danielstarek@yahoo.com', 'Fínska premiérka sa podrobila testu na drogy. Bola naň vyzvaná po zverejnení videa', 'Fínska premiérka uviedla, že sa podrobila testu na drogy. Výsledok bude známy na budúci týždeň. Vyzvali ju na to po zverejnení videa z večierka, ktoré vyvolalo vlnu kritiky.', '2022-08-19 19:11:00', '1660936317166.mp4');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
