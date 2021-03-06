function out = april_28_tnf_time_new(Node, t)
T1=2;
T2=3;
T3=5;
T4=6;
T5=8;
T6=9;
T7=10;

Node1=Node;
Node1(155)= Node(327);
Node1(215)= Node(216) & Node(328);
Node1(206)= (Node(378) & ~Node(176) & ~Node(174));
Node1(286)= Node(420);
Node1(67)= Node(66);
Node1(300)= (Node(406) & Node(265)) |(Node(412) & Node(265));
Node1(376)= Node(375) & ~Node(336);
Node1(285)= Node(419);
Node1(410)= Node(409) & ~Node(43);
Node1(419)= Node(402);
Node1(420)= Node(410);
Node1(66)= Node(382);
% Node1(22)= Node(390) & ~Node(66);
% Node1(34)= Node(273);
Node1(76)= ~Node(73);
% Node1(125)= Node(392) & ~Node(176); Housekeeping ciap
Node1(142)= Node(398) | Node(396);
Node1(145)= Node(125) & Node(142);
Node1(207)= Node(376);
Node1(208)= Node(384);
Node1(266)= Node(267) & Node(50);
Node1(272)= Node(39);
Node1(276)= Node(66);
Node1(277)= Node(207);



if t>=T1
Node1(4)= Node(3) & Node(2);
Node1(115)= Node(114) & Node(141);
Node1(117)= Node(116) & Node(192);
Node1(17)= ((Node(316) & Node(85) & Node(194)) | ~Node(318));
Node1(194)= (Node(195) & Node(316)) | (Node(195) & (Node(321) & Node(104)));
Node1(195)= Node(196) & Node(125);
Node1(5)= Node(318) | (Node(4) & (Node(124) & Node(7) & Node(123) & Node(125)));
Node1(58)= Node(59) & Node(6);
Node1(338)= Node(4) & Node(124);
Node1(113)= Node(112) & (Node(139) & Node(93) & Node(120));
Node1(114)= Node(113) & Node(108);
Node1(112)= Node(111) & Node(110);
Node1(78)= Node(77) & Node(13);
Node1(85)= Node(16) & Node(6);
Node1(118)= Node(309) & Node(115);
Node1(130)= Node(135) & Node(129);
Node1(61)= Node(331);
Node1(60)= (Node(61) & Node(58)) | ~Node(318);
Node1(51)= Node(52) & (Node(53) & Node(80));
Node1(101)= (Node(102) & Node(118)) | (Node(102) & Node(100)) | (Node(102) & Node(144));
Node1(49)= Node(101);
Node1(50)= Node(51);
Node1(35)= ((Node(34) & (Node(84) & Node(82)) | (Node(34) & Node(144)) | (Node(34) & Node(100))) | ~Node(206) | ~Node(208));
Node1(248)= Node(35);
Node1(131)= Node(134) & Node(4);
Node1(132)= Node(133) & Node(131);
Node1(147)= Node(146) & Node(132);
Node1(149)= Node(147);
Node1(141)= Node(140) & Node(130);
Node1(6)= (Node(5) & (Node(308) & Node(13) & Node(5)) | ~Node(154) | ~Node(318));
% Node1(7)= Node(6) & Node(121);
Node1(121)= Node(122) & Node(4);
Node1(10)= Node(5);
Node1(11)= Node(10) & Node(149);
Node1(12)= Node(11);
Node1(13)= (Node(12) & (Node(104) & Node(108)) | ~Node(318) | ~Node(337));
Node1(192)= Node(20);
Node1(281)= Node(192);
Node1(98)= Node(97) & Node(4);
Node1(96)= Node(326) & Node(4);
Node1(95)= (Node(94) & Node(96)) | ~Node(101);
Node1(274)= Node(275);
Node1(100)= Node(99) & Node(4);
Node1(37)= Node(36) & Node(35);
Node1(93)= Node(92) & Node(95);
Node1(91)= (Node(103) & (Node(144) & Node(93))) | ~Node(207);
Node1(104)= (Node(105) & Node(91)) | (Node(144) & Node(105));
Node1(139)= Node(138) & Node(130);
Node1(89)= Node(90) & Node(91);
Node1(120)= Node(311) & Node(88);
Node1(106)= Node(107) & (Node(13) & Node(101));
Node1(306)= Node(106);
Node1(308)= Node(307) & Node(306);
Node1(88)= Node(87) & Node(89);
Node1(129)= Node(128) & Node(136);
Node1(14)= Node(13) & Node(86);
Node1(16)= (Node(15) & Node(14)) | (Node(15) & Node(120));
Node1(316)= Node(317) & Node(55);
Node1(55)= Node(56) & Node(58);
Node1(108)= Node(109) & Node(132);
Node1(144)= Node(143) & Node(141);
Node1(128)= Node(137) & Node(4);
Node1(319)= Node(318) & Node(194);
Node1(322)= Node(321) & Node(194);
Node1(321)= Node(320) & (Node(55) & Node(13));
Node1(80)= Node(79) & Node(78);
Node1(84)= Node(83) & Node(85);
Node1(53)= (Node(54) & Node(55)) | ((Node(85) & Node(78)) & Node(54));
Node1(82)= (Node(81) & Node(78)) | (Node(81) & Node(85));
end

if t>=T2
Node1(20)= Node(21) & Node(193);
Node1(21)= Node(22) & Node(17);
Node1(23)= Node(18) & Node(192);
Node1(191)= Node(20);
Node1(19)= Node(20);
Node1(18)= Node(19) & Node(17);
Node1(24)= Node(23) & Node(275);
Node1(27)= Node(26) & Node(278);
Node1(25)= Node(24) & ~Node(282);
% Node1(336)= ((Node(27) & Node(28)) & ~Node(277) & ~Node(276) & ~Node(257));
Node1(26)= Node(25) & Node(279);
Node1(57)= Node(58) & Node(51);
Node1(310)= Node(82) & Node(104);
Node1(189)= Node(190) & Node(191);
Node1(33)= Node(119) & Node(6);
Node1(32)= (Node(31) & Node(157)) | (Node(31) & Node(33));
Node1(29)= Node(30) & (Node(51) & Node(101));
Node1(28)= Node(29);
Node1(278)= Node(32);
Node1(185)= Node(184) & Node(104);
Node1(73)= (Node(35) | ~Node(74) | ~Node(75));
Node1(279)= Node(280) & Node(281);
Node1(62)= (Node(63) & Node(60)) & ~Node(104);
Node1(64)= Node(62);
end

if t>=T3
Node1(259)= Node(258) & Node(252);
Node1(260)= Node(258) & Node(254);
Node1(262)= Node(261) & Node(259);
Node1(263)= Node(261) & Node(260);
Node1(44)= Node(45) & (Node(46) & Node(271));
Node1(43)= Node(42)& Node(271);
Node1(283)= Node(284) & Node(285);
Node1(292)= Node(288) & Node(289);
Node1(296)= Node(295) & Node(290);
Node1(171)= Node(170) & (Node(104) & Node(192) & Node(101));
Node1(172)= Node(170) & (Node(104) & Node(192) & Node(101));
Node1(65)= Node(66) & Node(35);
Node1(8)= (Node(6) & (Node(37) & Node(337))) | (Node(6) & Node(98));
Node1(9)= Node(8) & Node(334);
Node1(47)= Node(48) & (Node(50) & Node(248));
Node1(46)= Node(47) & Node(248);
Node1(250)= Node(249) & (Node(49) | Node(248) | Node(50));
Node1(251)= Node(250) & (Node(49) | Node(248));
Node1(252)= Node(251) & Node(49);
Node1(254)= Node(253) & Node(49);
Node1(41)= Node(40);
Node1(42)= Node(41) & (Node(50) & Node(49));
Node1(268)= Node(269) & Node(64);
Node1(269)= Node(270) & Node(274);
Node1(270)= Node(271) & (Node(274) | Node(64));
Node1(271)= Node(272) & Node(248);
Node1(39)= Node(408);
Node1(291)= Node(290) & Node(64);
Node1(282)= Node(283) & Node(218);
Node1(287)= Node(286) & Node(282);
Node1(293)= Node(292);
Node1(294)= Node(293);
Node1(301)= Node(369) | Node(370) |Node(422)| Node(294);
Node1(297)= Node(330) & Node(296);
Node1(298)= Node(330) & Node(296);
Node1(257)= Node(256) & Node(64);
Node1(256)= Node(255) & Node(49);
Node1(273)= Node(248) & Node(264);
Node1(264)= Node(340);
Node1(340)= Node(404) | ~Node(73);
Node1(38)= Node(39) & Node(37);
Node1(71)= Node(172);
Node1(332)= Node(55) &(Node(318) & Node(37));
Node1(352)= Node(351) & Node(336);
Node1(354)= Node(353) & Node(43);
Node1(355)= Node(352);
Node1(356)= Node(354);
Node1(357)= Node(358);
Node1(358)= Node(359) & (Node(336) & Node(43));
Node1(360)= Node(372) & Node(361);
Node1(343)= Node(342) & Node(298);
Node1(361)= Node(362);
Node1(362)= Node(363);
Node1(363)= Node(364) & Node(43);
Node1(365)= Node(366) & Node(43);
Node1(367)= (Node(368) & Node(43)) | (Node(368) & Node(336));
Node1(369)= Node(357);
Node1(370)= Node(371);
Node1(371)= Node(360);
Node1(373)= Node(374) & Node(361);
Node1(380)= Node(379) & Node(336);
Node1(345)= Node(344) & Node(336);
Node1(390)= Node(389) & Node(336);
Node1(347)= Node(346) & Node(336);
Node1(404)= Node(403) & Node(43);
Node1(406)= Node(405) & Node(336);
Node1(408)= Node(407) & Node(44);
Node1(348)= Node(343);
Node1(412)= Node(411) & Node(336);
Node1(414)= Node(413) &(Node(262) | Node(263));
Node1(415)= Node(373);
Node1(416)= Node(412);
Node1(417)= Node(367);
Node1(418)= Node(365);
Node1(349)= Node(347);
Node1(421)= Node(406);
Node1(422)= Node(415);
Node1(350)= Node(345);
Node1(318)= Node(394);
Node1(382)= Node(381) & ~Node(336);
Node1(402)= Node(401) & ~Node(43);
Node1(284)= Node(418);
Node1(40)= Node(414);
Node1(145)= Node(125) & Node(142);
Node1(272)= Node(39);
Node1(288)= Node(348) & ~Node(287);
Node1(290)= Node(417);
end

if t>=T4
Node1(68)= ((Node(72) & Node(69)) & ~Node(67) & ~Node(71));
Node1(302)= Node(304);
Node1(303)= Node(304);
Node1(304)= Node(386);
Node1(337)= Node(335) & Node(17);
Node1(305)= Node(304) & Node(37);
Node1(378)= Node(377) & Node(336);
Node1(384)= Node(383) & Node(336);
Node1(386)= Node(385) & Node(336);
Node1(388)= Node(387) & Node(336);
Node1(392)= Node(391) & Node(336);
Node1(394)= Node(393) & Node(336);
Node1(396)= Node(395) & Node(336);
Node1(398)= Node(397) & Node(336);
Node1(400)= Node(399) & Node(336);
Node1(74)= Node(400);
Node1(75)= Node(388);
Node1(208)= Node(384);
end

if t>=T5
Node1(151)= (Node(150) & Node(338) & ~Node(148));
Node1(153)= ((Node(152) & Node(151) | (Node(152) & Node(198))) & ~Node(302)) | ~Node(145);
Node1(166)= (Node(165) & Node(160)) | (Node(154)& Node(165)) | (Node(165) & Node(315));
Node1(72)= Node(166);
Node1(173)= Node(68);
Node1(174)= Node(68);
Node1(175)= Node(68);
Node1(176)= Node(68) | Node(70);
Node1(177)= Node(68);
Node1(187)= Node(188);
Node1(188)= (Node(205) & Node(186)) & ~Node(206);
Node1(159)= Node(155) & Node(4);
Node1(158)= Node(159) & Node(149);
Node1(160)= Node(156);
Node1(156)= Node(155) & Node(157);
Node1(157)= Node(333) & Node(158);
Node1(127)= Node(126) & Node(4);
Node1(154)= Node(153);
Node1(180)= (Node(175) & Node(178)) | (Node(175) & Node(179));
end


if t>=T6
Node1(203)= Node(202);
Node1(167)= Node(165) & Node(35);
Node1(70)= Node(167);
Node1(183)= (Node(184) & Node(180)) & ~Node(206);
Node1(339)= Node(186) & Node(101);
Node1(186)= Node(183) | Node(187);
Node1(198)= Node(197) & Node(187);
Node1(329)= Node(182);
Node1(182)= (Node(181) & Node(180)) & ~Node(206);
Node1(209)= Node(199);
Node1(313)= Node(312) & Node(187);
Node1(242)= Node(241) & (Node(247) & Node(209));
Node1(315)= Node(314);
Node1(328)= Node(187);
Node1(163)= ((Node(162) & Node(5)) & ~Node(164)) | ~Node(154);
Node1(199)= Node(198);
Node1(202)= Node(201);
Node1(201)= Node(200) & Node(163);
end


if t>=T7
Node1(423)= Node(349) | Node(355) | Node(356) | Node(357) | Node(415) | Node(362) | Node(416) | Node(421) | Node(371);
Node1(246)= Node(245) & Node(209);
Node1(211)= Node(210) & Node(209);
Node1(214)= Node(216) & Node(328);
Node1(299)= Node(211) | Node(213) | Node(214) | Node(177) | Node(173) | Node(218) | Node(220) | Node(222) | Node(224) | Node(226) | Node(228) | Node(230) | Node(232) | Node(234) | Node(236) |Node(238) |Node(240) |Node(242) |Node(244) |Node(246);
Node1(244)= Node(243) & Node(209);
Node1(213)= Node(212) & Node(328);
Node1(247)= Node(329);
Node1(240)= Node(239) & (Node(328) & Node(247));
Node1(314)= Node(313) & Node(127);
Node1(238)= Node(237) & (Node(247) & Node(328));
Node1(234)= Node(233) & Node(328);
Node1(236)= Node(235) & Node(209);
Node1(232)= Node(231) & (Node(328) & Node(209));
Node1(230)= Node(229) & Node(328);
Node1(220)= Node(219) & Node(328);
Node1(228)= Node(227) & Node(328);
Node1(218)= Node(217) & Node(328);
Node1(226)= Node(225) & Node(328);
Node1(224)= Node(223) & Node(328);
Node1(222)= Node(221) & Node(328);
Node1(204)= Node(203);
Node1(169)= Node(168) & Node(163);
Node1(336)= (Node(28) & Node(27)) | ~Node(277) | ~Node(276) | ~Node(257);
end

out=Node1;





