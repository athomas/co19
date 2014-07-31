
/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * after LayoutTests/fast/xpath/4XPath/Borrowed/od_20000608.html
 * @description
4XPath Performance test from "Olivier Deckmyn" <odeckmyn.list@teaser.fr>, with import and filename updates

Subject: [4suite] 4XPath performance ?
Date: Thu, 8 Jun 2000 16:30:21 +0200
From: "Olivier Deckmyn" <odeckmyn.list@teaser.fr>
To: "4Suite list" <4suite@dollar.fourthought.com>

I am playing and testing 4XPath....
And I am a little afraid of the results I see...
The machine is a Dell Server (2400) with a single PIII-750 and 256MB RAM,
USCSI disks (10K RPM), running FreeBSD4.

There is a lot of memory, cpu is not used for anything else than the test...

With a 100KB xml file, I have applied the attached test1.py

Here are the results :
QUERY="//author" (no match in the file)
Reading document
took 1.336457 sec
Starting query
took 307.572385 sec
Indexing DOM
took 0.125362 sec
Starting query
took 84.692544 sec

QUERY="//date" (few matches in the file)
Reading document
took 1.341848 sec
Starting query
took 308.466919 sec
<date> 10 October 1996</date><date>1 August 1996</date><date>17 April
1996</date><date> 17 April 1996</date><date> 17 April 1996</date><date> 12
April 1996</date><date>27 March 1996</date><date>27 March
1996</date><date>23 February 1996</date><date>9 December 1996</date><date>
29 November 1996</date><date> 31 October 1996</date>Indexing DOM
took 0.128668 sec
Starting query
took 85.145023 sec
<date> 10 October 1996</date><date>1 August 1996</date><date>17 April
1996</date><date> 17 April 1996</date><date> 17 April 1996</date><date> 12
April 1996</date><date>27 March 1996</date><date>27 March
1996</date><date>23 February 1996</date><date>9 December 1996</date><date>
29 November 1996</date><date> 31 October 1996</date>

Result :
Indexing is worth the price ! Very quick index build, and 3.5x speed gain
...
But, it very slow anyway :(

Is this the "normal" performance ? Can I do better?
 */
import "dart:html";
import "../../../../../Utils/expect.dart";
import "../../../../testcommon.dart";

void main() {
    XPathEvaluator evaluator=new XPathEvaluator();
    var req = new HttpRequest();
    req.open("GET", '$testSuiteRoot/fast/xpath/4XPath/Borrowed/resources/od_20000608.xml', async:false);
    req.send(null);
    var xml_dom_object = req.responseXml;
    var EXPR = '//author';
    var nodeset = evaluator.evaluate(EXPR, xml_dom_object, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeset.snapshotLength, 0);

    EXPR = '//date';
    nodeset = evaluator.evaluate(EXPR, xml_dom_object, null, XPathResult.UNORDERED_NODE_SNAPSHOT_TYPE, null);
    shouldBe(nodeset.snapshotLength, 12);
}