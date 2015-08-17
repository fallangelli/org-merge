<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title> 测试</title>
    <link rel="stylesheet" href="asset/css/screen.css" media="screen" />
    <link rel="stylesheet" href="asset/css/jquery.treetable.css" />
    <link rel="stylesheet" href="asset/css/jquery.treetable.theme.default.css" />
</head>
<body>
<div id="main">
    <h1>jQuery treetable</h1>

    <p><b><a href="http://plugins.jquery.com/treetable">Download</a> the latest release from the jQuery Plugin Registry or grab the <a href="https://github.com/ludo/jquery-treetable">source code</a> from Github.</b> Please <a href="https://github.com/ludo/jquery-treetable/issues">report issues</a> through Github issues. This plugin is released under both the MIT and the GPLv2 license by <a href="http://ludovandenboom.com">Ludo van den Boom</a>.</p>

    <table id="example-basic">
        <caption>Basic jQuery treetable Example</caption>
        <thead>
        <tr>
            <th>Tree column</th>
            <th>Additional data</th>
        </tr>
        </thead>
        <tbody>
        <tr data-tt-id="1">
            <td>Node 1: Click on the icon in front of me to expand this branch.</td>
            <td>I live in the second column.</td>
        </tr>
        <tr data-tt-id="1.1" data-tt-parent-id="1">
            <td>Node 1.1: Look, I am a table row <em>and</em> I am part of a tree!</td>
            <td>Interesting.</td>
        </tr>
        <tr data-tt-id="1.1.1" data-tt-parent-id="1.1">
            <td>Node 1.1.1: I am part of the tree too!</td>
            <td>That's it!</td>
        </tr>
        <tr data-tt-id="2">
            <td>Node 2: I am another root node, but without children</td>
            <td>Hurray!</td>
        </tr>
        </tbody>
    </table>

    <h2>Table of Contents</h2>
    <ol>
        <li><a href="#overview">Overview</a></li>
        <li><a href="#usage">Usage</a></li>
        <li><a href="#configuration">Configuration</a></li>
        <li><a href="#api">Public API</a></li>
        <li><a href="#examples">Examples</a></li>
        <li><a href="test.html">Test Suite</a></li>
        <li><a href="CHANGELOG.txt">CHANGELOG.txt</a></li>
    </ol>

    <h2><a name="overview">1. Overview</a></h2>

    <p>jQuery treetable is a plugin for <a href="http://jquery.com">jQuery</a>, the 'Write Less, Do More, JavaScript Library'. With this plugin you can display a tree in an HTML table, e.g. a directory structure or a nested list. Why not use a list, you say? Because lists are great for displaying a tree, and tables are not. Oh wait, but this plugin uses tables, doesn't it? Yes. Why do I use a table to display a list? Because I need multiple columns to display additional data besides the tree.</p>

    <h3>Unobtrusiveness</h3>

    <p>One of the goals of jQuery treetable is to be as unobtrusive as possible. Being 'unobtrusive' is very cool nowadays, so that was an important requirement. But it is cool for a reason: it keeps your HTML documents clean and it allows the code to degrade nicely when Javascript is not available.</p>

    <p>The treetable plugin only requires that you add specific <tt>data</tt> attributes to every row that is part of your tree. The plugin uses these attributes to determine what your tree looks like. Otherwise, it would have to guess the structure of the tree and it wouldn't be very successful in doing that. See the <a href="#usage">Usage</a> chapter for more information on how to prepare your tree.</p>

    <h3>Features</h3>
    <ul>
        <li>It can display a tree of data in a table column.</li>
        <li>It does this as unobtrusively as possible.</li>
        <li>It allows branches to be collapsed and expanded (think of how a directory structure works in most file explorers).</li>
        <li>It allows unlimited tree depth.</li>
        <li>It uses the lightweight <a href="http://jquery.com">jQuery</a> Javascript libray.</li>
    </ul>

    <h2><a name="usage">2. Usage</a></h2>

    <p><b>Note:</b> This chapter assumes that you have already installed jQuery as described on their website.</p>

    <h3><a name="head">Include the plugin in your document</a></h3>

    <p>The plugin can either be installed manually or by using the <a href="http://bower.io">Bower</a> package manager.</p>

    <h4>Installing with Bower</h4>

      <pre class="listing">
bower install jquery-treetable</pre>

    <p>Note that the only listed dependency is jQuery. If you also want to use the drag &amp; drop feature you'll have to install jQuery UI yourself.</p>

    <h4>Installing manually</h4>

    <p>Copy the files <tt>jquery.treetable.js</tt> and <tt>css/jquery.treetable.css</tt> to your project. Paste the following code right before the closing <tt>body</tt> tag in your HTML document. Make sure these lines are <b>below</b> the line where you include jQuery. Change the <b style="color: #f00;">red</b> parts to reflect your situation.</p>

      <pre class="listing">
&lt;link href="<b>path/to/</b>jquery.treetable.css" rel="stylesheet" type="text/css" /&gt;
&lt;script src="<b>path/to/</b>jquery.treetable.js"&gt;&lt;/script&gt;
&lt;script&gt;
$("<b>#your_table_id</b>").treetable();
&lt;/script&gt;</pre>

    <h3><a name="theme">Styling the tree</a></h3>

    <p>By default the tree has little styling. Use the file <tt>css/jquery.treetable.theme.default.css</tt> as a template for your own styling, or just use this default theme.</p>

    <h3><a name="tree">Representing your tree in a table</a></h3>
    <p>When you pasted the above code and adjusted it to reflect your situation, you enabled the <em>possibility</em> of displaying a tree in your table. To make the tree actually display as a tree you have to add <tt>data-tt-id</tt> and <tt>data-tt-parent-id</tt> attributes to your table rows (<tt>tr</tt>).</p>

    <h4>How to do this?</h4>
    <p>First, you should add a <em>unique</em> <tt>data-tt-id</tt> attribute to each of the rows in your table, for example '<tt>node-<em>x</em></tt>'. Then you add a <tt>data-tt-parent-id</tt> attribute to each child of a node, give this class a value of '<tt><em>node-x</em></tt>'. The <em>node-x</em> part should be the same as the <tt>data-tt-id</tt> of its parent. Do you still follow me? Let me show you an example of a very simple tree: a single parent with a single child. For more examples you should view the source code of this page, where you find several tables for the examples in the <a href="#examples">examples</a> chapter.</p>

      <pre class="listing">
&lt;table&gt;
  &lt;tr data-tt-id="1"&gt;
    &lt;td&gt;Parent&lt;/td&gt;
  &lt;/tr&gt;
  &lt;tr data-tt-id="2" data-tt-parent-id="1"&gt;
    &lt;td&gt;Child&lt;/td&gt;
  &lt;/tr&gt;
&lt;/table&gt;</pre>

    <p>Please note that the plugin expects the rows in the HTML table to be in the same order in which they should be displayed in the tree. For example, suppose you have three nodes: <strong style="color: red;">A</strong>, <strong style="color: navy;">B</strong> (child of node <span style="color: red">A</span>) and <strong style="color: green;">C</strong> (child of node <span style="color: navy">B</span>). If you create rows for these nodes in your HTML table in the following order <span style="color: red">A</span> - <span style="color: green">C</span> - <span style="color: navy">B</span>, then the tree will not display correctly. You have to make sure that the rows are in the order <span style="color: red">A</span> - <span style="color: navy">B</span> - <span style="color: green">C</span>.</p>

    <h2><a name="configuration">3. Configuration</a></h2>

    <p>There are several settings that let you adjust the behavior of the plugin. Each of these settings is described in this section. Pass these options and callback functions to the <tt>treetable()</tt> function. See the <a href="#examples">examples</a>.</p>

    <h3>Settings</h3>

    <table class="treetable">
        <thead>
        <tr>
            <th>Setting</th>
            <th>Type</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><tt>branchAttr</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;ttBranch&quot;</tt></td>
            <td>Optional data attribute that can be used to force the expander icon to be rendered on a node. This allows us to define a node as a branch node even though it does not have children yet. This translates to a <tt>data-tt-branch</tt> attribute in your HTML.</td>
        </tr>
        <tr>
            <td><tt>clickableNodeNames</tt></td>
            <td><tt>bool</tt></td>
            <td><tt>false</tt></td>
            <td>Set to true to expand branches not only when expander icon is clicked but also when node name is clicked.</td>
        </tr>
        <tr>
            <td><tt>column</tt></td>
            <td><tt>int</tt></td>
            <td><tt>0</tt></td>
            <td>The number of the column in the table that should be displayed as a tree.</td>
        </tr>
        <tr>
            <td><tt>columnElType</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;td&quot;</tt></td>
            <td>The types of cells that should be considered for the tree (<tt>td</tt>, <tt>th</tt> or both).</td>
        </tr>
        <tr>
            <td><tt>expandable</tt></td>
            <td><tt>bool</tt></td>
            <td><tt>false</tt></td>
            <td>Should the tree be expandable? An expandable tree contains buttons to make each branch with children collapsible/expandable.</td>
        </tr>
        <tr>
            <td><tt>expanderTemplate</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&lt;a href=&quot;#&quot;&gt;&amp;nbsp;&lt;/a&gt;</tt></td>
            <td>The HTML fragment used for the expander.</td>
        </tr>
        <tr>
            <td><tt>indent</tt></td>
            <td><tt>int</tt></td>
            <td><tt>19</tt></td>
            <td>The number of pixels that each branch should be indented with.</td>
        </tr>
        <tr>
            <td><tt>indenterTemplate</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&lt;span class=&quot;indenter&quot;&gt;&lt;/span&gt;</tt></td>
            <td>The HTML fragment used for the indenter.</td>
        </tr>
        <tr>
            <td><tt>initialState</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;collapsed&quot;</tt></td>
            <td>Possible values: <tt>&quot;expanded&quot;</tt> or <tt>&quot;collapsed&quot;</tt>.</td>
        </tr>
        <tr>
            <td><tt>nodeIdAttr</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;ttId&quot;</tt></td>
            <td>Name of the data attribute used to identify node. Translates to <tt>data-tt-id</tt> in your HTML.</td>
        </tr>
        <tr>
            <td><tt>parentIdAttr</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;ttParentId&quot;</tt></td>
            <td>Name of the data attribute used to set parent node. Translates to <tt>data-tt-parent-id</tt> in your HTML.</td>
        </tr>
        <tr>
            <td><tt>stringCollapse</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;Collapse&quot;</tt></td>
            <td>For internationalization.</td>
        </tr>
        <tr>
            <td><tt>stringExpand</tt></td>
            <td><tt>string</tt></td>
            <td><tt>&quot;Expand&quot;</tt></td>
            <td>For internationalization.</td>
        </tr>
        </tbody>
    </table>

    <h3>Events</h3>

    <table class="treetable">
        <thead>
        <tr>
            <th>Setting</th>
            <th>Type</th>
            <th>Default</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><tt>onInitialized</tt></td>
            <td><tt>function</tt></td>
            <td><tt>null</tt></td>
            <td>Callback function fired when the tree has been initialized.</td>
        </tr>
        <tr>
            <td><tt>onNodeCollapse</tt></td>
            <td><tt>function</tt></td>
            <td><tt>null</tt></td>
            <td>Callback function fired when a branch is collapsed.</td>
        </tr>
        <tr>
            <td><tt>onNodeExpand</tt></td>
            <td><tt>function</tt></td>
            <td><tt>null</tt></td>
            <td>Callback function fired when a branch is expanded.</td>
        </tr>
        <tr>
            <td><tt>onNodeInitialized</tt></td>
            <td><tt>function</tt></td>
            <td><tt>null</tt></td>
            <td>Callback function fired when a node has been initialized.</td>
        </tr>
        </tbody>
    </table>

    <h2><a name="api">4. Public API</a></h2>

    <h3><tt>treetable()</tt> Plugin Function</h3>

    <p>The <tt>treetable()</tt> function accepts the following arguments:</p>

    <dl>
        <dt><tt>options</tt> (optional)</dt>
        <dd>A Javascript object of configuration settings as described in the chapter on <a href="#configuration">configuration</a>.</dd>
        <dt><tt>force</tt> (optional)</dt>
        <dd>Pass the boolean <tt>true</tt> to force reinitialization of the tree.</dd>
    </dl>

    <h3>Additional Functions</h3>

    <p>Use the following functions to manipulate the tree programmatically. Calling a function should be done through the <tt>treetable()</tt> function. For example, to collapse node '42' use <tt>$("#tree").treetable("collapseNode", "42")</tt>.</p>

    <dl>
        <dt><tt>collapseAll()</tt></dt>
        <dd>Collapse all nodes at once.</dd>
        <dt><tt>collapseNode(id)</tt></dt>
        <dd>Collapse a single node, identified by <tt>id</tt>.</dd>
        <dt><tt>expandAll()</tt></dt>
        <dd>Expand all nodes at once.</dd>
        <dt><tt>expandNode(id)</tt></dt>
        <dd>Expand a single node, identified by <tt>id</tt>.</dd>
        <dt><tt>loadBranch(node, rows)</tt></dt>
        <dd>Load additional rows (HTML <tt>&lt;tr&gt;</tt>s) into the tree, with parent <tt>node</tt>. If <tt>node</tt> is <tt>null</tt> rows will be added as root nodes.</dd>
        <dt><tt>move(nodeId, destinationId)</tt></dt>
        <dd>Move node <tt>nodeId</tt> to new parent with <tt>destinationId</tt>.</dd>
        <dt><tt>node(id)</tt></dt>
        <dd>Select a node from the tree. Returns a <tt>TreeTable.Node</tt> object.</dd>
        <dt><tt>removeNode(id)</tt></dt>
        <dd>Remove a node and all its descendants from the tree.</dd>
        <dt><tt>reveal(id)</tt></dt>
        <dd>Reveal a node in the tree.</dd>
        <dt><tt>sortBranch(node)</tt>, <tt>sortBranch(node, columnOrFunction)</tt></dt>
        <dd>Sort <tt>node</tt>'s children alphabetically. Defaults to sorting on the values in the configured tree column (see settings). Pass an optional column number or sorting function as the second argument <tt>columnOrFunction</tt>. See <a href="test.html?grep=treetable()%20sortBranch()">the tests</a> for examples of custom sorting functions. Does not recursively sort children of children.</dd>
        <dt><tt>unloadBranch(node)</tt></dt>
        <dd>Remove nodes/rows (HTML <tt>&lt;tr&gt;</tt>s) from the tree, with parent <tt>node</tt>. Note that the parent (<tt>node</tt>) will not be removed.</dd>
    </dl>


    <h3>Classes</h3>
    The following classes are dynamically added to the tree rows:
    <dl>
        <dt><tt>expanded</tt></dt>
        <dd>When the row is expanded</dd>
        <dt><tt>collapsed</tt></dt>
        <dd>When the row is collapsed</dd>
        <dt><tt>branch</tt></dt>
        <dd>When the row has children or the branchAttr is present</dd>
        <dt><tt>leaf</tt></dt>
        <dd>When the row has no children</dd>
    </dl>


    <h2><a name="examples">5. Examples</a></h2>

    <h3>Basic Static Tree</h3>

    <table id="example-basic-static">
        <tr data-tt-id="0">
            <td>app</td>
        </tr>
        <tr data-tt-id="1" data-tt-parent-id="0">
            <td>controllers</td>
        </tr>
        <tr data-tt-id="5" data-tt-parent-id="1">
            <td>application_controller.rb</td>
        </tr>
        <tr data-tt-id="2" data-tt-parent-id="0">
            <td>helpers</td>
        </tr>
        <tr data-tt-id="3" data-tt-parent-id="0">
            <td>models</td>
        </tr>
        <tr data-tt-id="4" data-tt-parent-id="0">
            <td>views</td>
        </tr>
    </table>

      <pre class="listing">
$("#example-basic-static").treetable();</pre>

    <h3>Basic Expandable Tree</h3>

    <table id="example-basic-expandable">
        <tr data-tt-id="0">
            <td>app</td>
        </tr>
        <tr data-tt-id="1" data-tt-parent-id="0">
            <td>controllers</td>
        </tr>
        <tr data-tt-id="5" data-tt-parent-id="1">
            <td>application_controller.rb</td>
        </tr>
        <tr data-tt-id="2" data-tt-parent-id="0">
            <td>helpers</td>
        </tr>
        <tr data-tt-id="3" data-tt-parent-id="0">
            <td>models</td>
        </tr>
        <tr data-tt-id="4" data-tt-parent-id="0">
            <td>views</td>
        </tr>
    </table>

      <pre class="listing">
$("#example-basic-expandable").treetable({ expandable: true });</pre>

    <h3>Complex Tree With Drag and Drop</h3>

    <p>This example uses <a href="http://jqueryui.com">jQuery UI</a>'s Draggable and Droppable components. The tree has 459 nodes.</p>

    <form id="reveal">
        <input type="text" name="nodeId" placeholder="nodeId" id="revealNodeId"/>
        <input type="submit" value="Reveal"/><br/>
        <small>Examples: <tt>2-1-1</tt>, <tt>3-1-1-2-2</tt> and <tt>3-2-1-2-3-1-2-2-1-1-1-1-2-5</tt></small>
    </form>

    <table id="tree_ed">
        <caption>
            <a href="#" onclick="jQuery('#tree_ed').treetable('expandAll'); return false;">Expand all</a>
            <a href="#" onclick="jQuery('#tree_ed').treetable('collapseAll'); return false;">Collapse all</a>
        </caption>
        <thead>
        <tr>
            <th>Name</th>
            <th>Kind</th>
            <th>Size</th>
        </tr>
        </thead>
        <tbody>
        <tr data-tt-id='1'><td><span class='file'>Acknowledgements.rtf</span></td><td>File</td><td>480.95 KB</td></tr>
        <tr data-tt-id='2'><td><span class='folder'>CHUD</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-1' data-tt-parent-id='2'><td><span class='folder'>amber</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-1-1' data-tt-parent-id='2-1'><td><span class='file'>AmberTraceFormats.pdf</span></td><td>File</td><td>124.46 KB</td></tr>
        <tr data-tt-id='2-2' data-tt-parent-id='2'><td><span class='folder'>BigTop</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-2-1' data-tt-parent-id='2-2'><td><span class='file'>BigTopUserGuide.pdf</span></td><td>File</td><td>1314.71 KB</td></tr>
        <tr data-tt-id='2-3' data-tt-parent-id='2'><td><span class='folder'>Saturn</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-3-1' data-tt-parent-id='2-3'><td><span class='file'>SaturnUserGuide.pdf</span></td><td>File</td><td>694.29 KB</td></tr>
        <tr data-tt-id='2-4' data-tt-parent-id='2'><td><span class='folder'>Shark</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-4-1' data-tt-parent-id='2-4'><td><span class='file'>SharkUserGuide.pdf</span></td><td>File</td><td>12902.51 KB</td></tr>
        <tr data-tt-id='2-5' data-tt-parent-id='2'><td><span class='folder'>simg4</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-6' data-tt-parent-id='2'><td><span class='folder'>simg4_plus</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='2-7' data-tt-parent-id='2'><td><span class='folder'>simg5</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3'><td><span class='folder'>DocSets</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1' data-tt-parent-id='3'><td><span class='folder'>com.apple.ADC_Reference_Library.CoreReference.docset</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1' data-tt-parent-id='3-1'><td><span class='folder'>Contents</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-1' data-tt-parent-id='3-1-1'><td><span class='file'>Info.plist</span></td><td>File</td><td>1.23 KB</td></tr>
        <tr data-tt-id='3-1-1-2' data-tt-parent-id='3-1-1'><td><span class='folder'>Resources</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-1' data-tt-parent-id='3-1-1-2'><td><span class='file'>docSet.dsidx</span></td><td>File</td><td>41504 KB</td></tr>
        <tr data-tt-id='3-1-1-2-2' data-tt-parent-id='3-1-1-2'><td><span class='file'>docSet.skidx</span></td><td>File</td><td>43072 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3' data-tt-parent-id='3-1-1-2'><td><span class='folder'>Documents</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1' data-tt-parent-id='3-1-1-2-3'><td><span class='folder'>documentation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Accessibility</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1' data-tt-parent-id='3-1-1-2-3-1-1'><td><span class='folder'>Reference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1' data-tt-parent-id='3-1-1-2-3-1-1-1'><td><span class='folder'>AccessibilityCarbonRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-1' data-tt-parent-id='3-1-1-2-3-1-1-1-1'><td><span class='folder'>CarbonAXRefRevisions</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-1-1' data-tt-parent-id='3-1-1-2-3-1-1-1-1-1'><td><span class='file'>CarbonAXRefRevisions.html</span></td><td>File</td><td>7.44 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-2' data-tt-parent-id='3-1-1-2-3-1-1-1-1'><td><span class='folder'>Index</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-2-1' data-tt-parent-id='3-1-1-2-3-1-1-1-1-2'><td><span class='file'>index_of_book.html</span></td><td>File</td><td>174.1 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-3' data-tt-parent-id='3-1-1-2-3-1-1-1-1'><td><span class='file'>index.html</span></td><td>File</td><td>1.1 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-4' data-tt-parent-id='3-1-1-2-3-1-1-1-1'><td><span class='folder'>Reference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-4-1' data-tt-parent-id='3-1-1-2-3-1-1-1-1-4'><td><span class='file'>reference.html</span></td><td>File</td><td>196.28 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-1-5' data-tt-parent-id='3-1-1-2-3-1-1-1-1'><td><span class='file'>toc.html</span></td><td>File</td><td>15.92 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2' data-tt-parent-id='3-1-1-2-3-1-1-1'><td><span class='folder'>AccessibilityLowlevel</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-1' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>accessibility</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-1-1' data-tt-parent-id='3-1-1-2-3-1-1-1-2-1'><td><span class='file'>CompositePage.html</span></td><td>File</td><td>5.7 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-1-2' data-tt-parent-id='3-1-1-2-3-1-1-1-2-1'><td><span class='file'>index.html</span></td><td>File</td><td>1.67 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-1-3' data-tt-parent-id='3-1-1-2-3-1-1-1-2-1'><td><span class='file'>toc.html</span></td><td>File</td><td>2.87 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-2' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='file'>accessibility-constants.html</span></td><td>File</td><td>26.94 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-3' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='file'>accessibility-datatypes.html</span></td><td>File</td><td>11.02 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-4' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='file'>accessibility-functions.html</span></td><td>File</td><td>15.55 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-5' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='file'>accessibility-mpindex.html</span></td><td>File</td><td>9.87 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-6' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXActionConstants</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-6-1' data-tt-parent-id='3-1-1-2-3-1-1-1-2-6'><td><span class='file'>CompositePage.html</span></td><td>File</td><td>15.08 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-6-2' data-tt-parent-id='3-1-1-2-3-1-1-1-2-6'><td><span class='file'>index.html</span></td><td>File</td><td>1.67 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-6-3' data-tt-parent-id='3-1-1-2-3-1-1-1-2-6'><td><span class='file'>toc.html</span></td><td>File</td><td>4.9 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-7' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXAttributeConstants</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-8' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXError</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-9' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXNotificationConstants</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-10' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXRoleConstants</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-11' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXTextAttributedString</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-12' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXUIElement</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-13' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXValue</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-14' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>AXValueConstants</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-15' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='file'>index.html</span></td><td>File</td><td>10.1 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-1-1-2-16' data-tt-parent-id='3-1-1-2-3-1-1-1-2'><td><span class='folder'>UniversalAccess</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-2' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>adcstyle.css</span></td><td>File</td><td>15.86 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>AppleApplications</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1' data-tt-parent-id='3-1-1-2-3-1-3'><td><span class='folder'>Reference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AddressBookC_Collection</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1-1' data-tt-parent-id='3-1-1-2-3-1-3-1-1'><td><span class='folder'>Index</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1-1-1' data-tt-parent-id='3-1-1-2-3-1-3-1-1-1'><td><span class='file'>index_of_book.html</span></td><td>File</td><td>153.98 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1-2' data-tt-parent-id='3-1-1-2-3-1-3-1-1'><td><span class='file'>index.html</span></td><td>File</td><td>13.62 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1-3' data-tt-parent-id='3-1-1-2-3-1-3-1-1'><td><span class='folder'>Introduction</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1-3-1' data-tt-parent-id='3-1-1-2-3-1-3-1-1-3'><td><span class='file'>Introduction.html</span></td><td>File</td><td>5.41 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-1-4' data-tt-parent-id='3-1-1-2-3-1-3-1-1'><td><span class='file'>RevisionHistory.html</span></td><td>File</td><td>4.66 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AddressBookRefUpdate</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1' data-tt-parent-id='3-1-1-2-3-1-3-1-2'><td><span class='folder'>Articles</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1-1' data-tt-parent-id='3-1-1-2-3-1-3-1-2-1'><td><span class='file'>AddressBook_10.1-10.2_SymbolChanges.html</span></td><td>File</td><td>80.84 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1-2' data-tt-parent-id='3-1-1-2-3-1-3-1-2-1'><td><span class='file'>AddressBook_10.2-10.3_SymbolChanges.html</span></td><td>File</td><td>54.2 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1-3' data-tt-parent-id='3-1-1-2-3-1-3-1-2-1'><td><span class='file'>AddressBook_10.3-10.4_SymbolChanges.html</span></td><td>File</td><td>14.78 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1-4' data-tt-parent-id='3-1-1-2-3-1-3-1-2-1'><td><span class='file'>AddressBook_10.4-10.5_SymbolChanges.html</span></td><td>File</td><td>11.03 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1-5' data-tt-parent-id='3-1-1-2-3-1-3-1-2-1'><td><span class='file'>Introduction.html</span></td><td>File</td><td>7.3 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-1-6' data-tt-parent-id='3-1-1-2-3-1-3-1-2-1'><td><span class='file'>RevisionHistory.html</span></td><td>File</td><td>6.19 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-2' data-tt-parent-id='3-1-1-2-3-1-3-1-2'><td><span class='file'>index.html</span></td><td>File</td><td>1.08 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-2-3' data-tt-parent-id='3-1-1-2-3-1-3-1-2'><td><span class='file'>toc.html</span></td><td>File</td><td>2.84 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-3' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AMWorkflow_class</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-4' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AMWorkflowController_class</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-5' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AMWorkflowView_Class</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-6' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AppleApp_Aperture_002</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-7' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>Automator_constants</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-8' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AutomatorFramework</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-9' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AutomatorReference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-10' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>AutomatorRefUpdate</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-11' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>CalendarStoreFramework</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-12' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>CalendarStoreReference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-13' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>CalendarStoreRefUpdate</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-14' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>Dashboard_Ref</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-15' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>FinalCutPro_XML</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-16' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>InstantMessageFramework</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-17' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>InstantMessageFrameworkRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-18' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>InstantMessageRefUpdate</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-19' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>iSyncJavaScriptRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-20' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>iSyncManualTestSuiteRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-21' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>iSyncSyncMLRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-22' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>MessageFrameworkReference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-23' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>Motion_FXPlug_Ref</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-24' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>SafariCSSRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-25' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>SafariHTMLRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-26' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>SyncServicesRefUpdate</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-27' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>SyncServicesSchemaRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-3-1-28' data-tt-parent-id='3-1-1-2-3-1-3-1'><td><span class='folder'>WebKitDOMRef</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>AppleScript</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1' data-tt-parent-id='3-1-1-2-3-1-4'><td><span class='folder'>Reference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1' data-tt-parent-id='3-1-1-2-3-1-4-1'><td><span class='folder'>StudioReference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>art</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-1' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>boxes.gif</span></td><td>File</td><td>11.52 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-2' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>browser.gif</span></td><td>File</td><td>26.04 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-3' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>button_in_window.gif</span></td><td>File</td><td>8.17 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-4' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>cc_app_info_window.gif</span></td><td>File</td><td>24.36 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-5' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>circular_prog_indicator.gif</span></td><td>File</td><td>0.65 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-6' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>color_panel.jpg</span></td><td>File</td><td>24.91 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-7' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>color_well.gif</span></td><td>File</td><td>7.58 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-8' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>combobox.gif</span></td><td>File</td><td>1.44 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-9' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>comboboxlist.gif</span></td><td>File</td><td>4.12 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-10' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>display_alert.gif</span></td><td>File</td><td>28.69 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-11' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>display_dialog.gif</span></td><td>File</td><td>28.42 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-12' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>doc_exp_groups.gif</span></td><td>File</td><td>22.52 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-13' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>drawer.gif</span></td><td>File</td><td>34.4 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-14' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>drawer_content_view.gif</span></td><td>File</td><td>8.21 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-15' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>drawer_instances_in_nib.gif</span></td><td>File</td><td>20.97 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-16' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>drawers_in_palette.gif</span></td><td>File</td><td>17.34 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-17' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>files_owner_in_nib.gif</span></td><td>File</td><td>15.24 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-18' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>font_panel.gif</span></td><td>File</td><td>17.16 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-19' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>hw_exp_grps_files.gif</span></td><td>File</td><td>15.35 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-20' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>ib_number_formatter.gif</span></td><td>File</td><td>1.46 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-21' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>image_tab_mainmenu_nib.gif</span></td><td>File</td><td>12.33 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-22' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>image_view_from_app.gif</span></td><td>File</td><td>17.18 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-23' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>matrix.gif</span></td><td>File</td><td>7.36 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-24' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>menu_item.gif</span></td><td>File</td><td>16.85 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-25' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>menu_showing_file_menu.gif</span></td><td>File</td><td>17 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-26' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>movie_view.gif</span></td><td>File</td><td>34.76 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-27' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>number_formatter_info.gif</span></td><td>File</td><td>24.8 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-28' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>open_panel.gif</span></td><td>File</td><td>32.06 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-29' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>outline_view.gif</span></td><td>File</td><td>18.7 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-30' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>popup_button.gif</span></td><td>File</td><td>6.76 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-31' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>progindindet.gif</span></td><td>File</td><td>3.78 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-32' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>save_panel.gif</span></td><td>File</td><td>39.43 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-33' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>secure_text_field.gif</span></td><td>File</td><td>9.91 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-34' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>simple_toolbar.gif</span></td><td>File</td><td>10.4 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-35' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>sliders.gif</span></td><td>File</td><td>11.01 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-36' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>sounds_in_nib_window.gif</span></td><td>File</td><td>22.26 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-37' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>split_view.gif</span></td><td>File</td><td>15.73 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-38' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>stepper.gif</span></td><td>File</td><td>1.08 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-39' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>table_app.gif</span></td><td>File</td><td>22.72 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-40' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>table_view.gif</span></td><td>File</td><td>14.55 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-41' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>tabview.gif</span></td><td>File</td><td>24.86 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-42' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>text_fields.gif</span></td><td>File</td><td>7.1 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-43' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>text_view.gif</span></td><td>File</td><td>12.18 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-44' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>to_do_outline.gif</span></td><td>File</td><td>15.4 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-1-45' data-tt-parent-id='3-1-1-2-3-1-4-1-1-1'><td><span class='file'>window.gif</span></td><td>File</td><td>6.41 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-2' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>Index</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-3' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='file'>index.html</span></td><td>File</td><td>1.13 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-4' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr10_panel_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-5' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr10_pplugin_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-6' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr11_textview_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-7' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr1_about</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-8' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr2_fundamentals</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-9' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr3_app_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-10' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr4_container_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-11' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr5_control_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-12' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr6_data_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-13' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr7_doc_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-14' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr8_drag_drop_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-15' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr9_menu_suite</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-16' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='folder'>sr_history</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-4-1-1-17' data-tt-parent-id='3-1-1-2-3-1-4-1-1'><td><span class='file'>toc.html</span></td><td>File</td><td>132.84 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-5' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Carbon</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-6' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Cocoa</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-7' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>CoreFoundation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-8' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>css</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-9' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Darwin</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-10' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>DeveloperTools</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-11' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>DeviceDrivers</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-12' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Games</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-13' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>GraphicsImaging</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-14' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Hardware</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-15' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>HardwareDrivers</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-16' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>images</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-17' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-date.html</span></td><td>File</td><td>74.06 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-18' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-date0.html</span></td><td>File</td><td>284.1 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-19' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-date2.html</span></td><td>File</td><td>73.94 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-20' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-date3.html</span></td><td>File</td><td>74.4 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-21' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-date4.html</span></td><td>File</td><td>75.11 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-22' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-date5.html</span></td><td>File</td><td>41.11 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-23' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-rev-date.html</span></td><td>File</td><td>49.03 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-24' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-rev-revision.html</span></td><td>File</td><td>49.01 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-25' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-rev-title.html</span></td><td>File</td><td>49.03 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-26' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-rev-topic.html</span></td><td>File</td><td>71.41 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-27' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-rev-topic0.html</span></td><td>File</td><td>93.76 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-28' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-rev-topic2.html</span></td><td>File</td><td>29.61 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-29' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-title.html</span></td><td>File</td><td>73.91 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-30' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-title0.html</span></td><td>File</td><td>284.11 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-31' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-title2.html</span></td><td>File</td><td>74.7 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-32' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-title3.html</span></td><td>File</td><td>73 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-33' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-title4.html</span></td><td>File</td><td>74.15 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-34' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-title5.html</span></td><td>File</td><td>42.91 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-35' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic.html</span></td><td>File</td><td>72.46 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-36' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic0.html</span></td><td>File</td><td>601.26 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-37' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic10.html</span></td><td>File</td><td>74.41 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-38' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic2.html</span></td><td>File</td><td>73.6 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-39' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic3.html</span></td><td>File</td><td>72.47 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-40' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic4.html</span></td><td>File</td><td>71.89 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-41' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic5.html</span></td><td>File</td><td>73.89 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-42' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic6.html</span></td><td>File</td><td>73.1 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-43' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic7.html</span></td><td>File</td><td>70.55 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-44' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic8.html</span></td><td>File</td><td>71.25 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-45' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index-topic9.html</span></td><td>File</td><td>72.56 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-46' data-tt-parent-id='3-1-1-2-3-1'><td><span class='file'>index.html</span></td><td>File</td><td>20.65 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-47' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Internationalization</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-48' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>InternetWeb</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-49' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>iPhone</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-50' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>js</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-51' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>LegacyTechnologies</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-52' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>MacOSX</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-53' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>MacOSXServer</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-54' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>MusicAudio</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-55' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Networking</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-56' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>OpenSource</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-57' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Performance</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-58' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Porting</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-59' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Printing</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-60' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>QuickTime</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-61' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Resources</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-62' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>ScriptingAutomation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-63' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Security</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-64' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>Storage</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-65' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>TextFonts</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-66' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>UserExperience</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-1-67' data-tt-parent-id='3-1-1-2-3-1'><td><span class='folder'>WebObjects</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-2' data-tt-parent-id='3-1-1-2-3'><td><span class='folder'>referencelibrary</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-1' data-tt-parent-id='3-1-1-2-3-2'><td><span class='file'>adc.css</span></td><td>File</td><td>1.46 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-2' data-tt-parent-id='3-1-1-2-3-2'><td><span class='file'>base.css</span></td><td>File</td><td>1.08 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-3' data-tt-parent-id='3-1-1-2-3-2'><td><span class='folder'>images</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-3-1' data-tt-parent-id='3-1-1-2-3-2-3'><td><span class='file'>body_bg.gif</span></td><td>File</td><td>0.24 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-3-2' data-tt-parent-id='3-1-1-2-3-2-3'><td><span class='file'>main_bgbottom.gif</span></td><td>File</td><td>2.35 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-3-3' data-tt-parent-id='3-1-1-2-3-2-3'><td><span class='file'>main_bgtop.gif</span></td><td>File</td><td>6.88 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-3-4' data-tt-parent-id='3-1-1-2-3-2-3'><td><span class='file'>main_bgtop_stroke.gif</span></td><td>File</td><td>7.62 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-3-5' data-tt-parent-id='3-1-1-2-3-2-3'><td><span class='file'>UpdateBanner_core.png</span></td><td>File</td><td>24.25 KB</td></tr>
        <tr data-tt-id='3-1-1-2-3-2-4' data-tt-parent-id='3-1-1-2-3-2'><td><span class='file'>index.html</span></td><td>File</td><td>1.15 KB</td></tr>
        <tr data-tt-id='3-1-1-3' data-tt-parent-id='3-1-1'><td><span class='file'>version.plist</span></td><td>File</td><td>0.44 KB</td></tr>
        <tr data-tt-id='3-2' data-tt-parent-id='3'><td><span class='folder'>com.apple.ADC_Reference_Library.DeveloperTools.docset</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1' data-tt-parent-id='3-2'><td><span class='folder'>Contents</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-1' data-tt-parent-id='3-2-1'><td><span class='file'>Info.plist</span></td><td>File</td><td>1.33 KB</td></tr>
        <tr data-tt-id='3-2-1-2' data-tt-parent-id='3-2-1'><td><span class='folder'>Resources</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-1' data-tt-parent-id='3-2-1-2'><td><span class='file'>docSet.dsidx</span></td><td>File</td><td>2752 KB</td></tr>
        <tr data-tt-id='3-2-1-2-2' data-tt-parent-id='3-2-1-2'><td><span class='file'>docSet.skidx</span></td><td>File</td><td>5664 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3' data-tt-parent-id='3-2-1-2'><td><span class='folder'>Documents</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>documentation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-1' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>adcstyle.css</span></td><td>File</td><td>15.86 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>AppleApplications</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-1' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>AppleApplications.html</span></td><td>File</td><td>0.22 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='folder'>Conceptual</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1' data-tt-parent-id='3-2-1-2-3-1-2-2'><td><span class='folder'>Dashcode_UserGuide</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1'><td><span class='folder'>Contents</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1'><td><span class='folder'>Resources</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>de.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>Advanced</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-1-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-1'><td><span class='file'>chapter_8_section_1.html</span></td><td>File</td><td>6.71 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-1-2' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-1'><td><span class='file'>chapter_8_section_2.html</span></td><td>File</td><td>7.93 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-1-3' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-1'><td><span class='file'>chapter_8_section_3.html</span></td><td>File</td><td>6.38 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>Art</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>apple_birthday_widget.jpg</span></td><td>File</td><td>33.5 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-2' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>canvas_inspector.jpg</span></td><td>File</td><td>71.75 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-3' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>countdown_attributes.jpg</span></td><td>File</td><td>46.69 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-4' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>project_window.jpg</span></td><td>File</td><td>107.57 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-5' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>source_code_inspector.jpg</span></td><td>File</td><td>76.19 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-6' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>webapp_add_code.jpg</span></td><td>File</td><td>85.65 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-7' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>webapp_add_part.jpg</span></td><td>File</td><td>108.16 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-8' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>webapp_first_test.jpg</span></td><td>File</td><td>86.82 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-2-9' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1-2'><td><span class='file'>webapp_project_window.jpg</span></td><td>File</td><td>152.27 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-3' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='file'>chapter_999_section_1.html</span></td><td>File</td><td>6.3 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-4' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>CodeAndDebugging</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-5' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='file'>Dashcode_UserGuide.pdf</span></td><td>File</td><td>1875.27 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-6' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>DebuggingSharing</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-7' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>DesignTools</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-8' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='file'>index.html</span></td><td>File</td><td>1.11 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-9' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>Introduction</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-10' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>MakingaWebApp</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-11' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>MakingaWidgetwithDashcode</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-12' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>PartsReference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-13' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>Templates</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-14' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='file'>toc.html</span></td><td>File</td><td>38.57 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-1-15' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-1'><td><span class='folder'>WidgetProjects</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>en.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>Advanced</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-1-1' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2-1'><td><span class='file'>chapter_8_section_1.html</span></td><td>File</td><td>6.6 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-1-2' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2-1'><td><span class='file'>chapter_8_section_2.html</span></td><td>File</td><td>7.4 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-1-3' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2-1'><td><span class='file'>chapter_8_section_3.html</span></td><td>File</td><td>6.24 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-2' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>Art</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-3' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='file'>chapter_999_section_1.html</span></td><td>File</td><td>6.2 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-4' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>CodeAndDebugging</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-5' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='file'>Dashcode_UserGuide.pdf</span></td><td>File</td><td>1087.36 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-6' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>DebuggingSharing</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-7' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>DesignTools</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-8' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='file'>index.html</span></td><td>File</td><td>1.09 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-9' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>Introduction</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-10' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>MakingaWebApp</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-11' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>MakingaWidgetwithDashcode</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-12' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>PartsReference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-13' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>Templates</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-14' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='file'>toc.html</span></td><td>File</td><td>38.11 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-2-15' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1-2'><td><span class='folder'>WidgetProjects</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-3' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>es.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-4' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>fr.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-5' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>it.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-6' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>ja.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-7' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>nl.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-2-1-1-1-8' data-tt-parent-id='3-2-1-2-3-1-2-2-1-1-1'><td><span class='folder'>zh.lproj</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-3' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>Dashboard-date.html</span></td><td>File</td><td>10.88 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-4' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>Dashboard-rev-date.html</span></td><td>File</td><td>8.85 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-5' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>Dashboard-rev-revision.html</span></td><td>File</td><td>8.83 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-6' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>Dashboard-rev-title.html</span></td><td>File</td><td>8.85 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-7' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>Dashboard-title.html</span></td><td>File</td><td>10.71 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-8' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-date.html</span></td><td>File</td><td>11.79 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-9' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-rev-date.html</span></td><td>File</td><td>9.38 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-10' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-rev-revision.html</span></td><td>File</td><td>9.36 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-11' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-rev-title.html</span></td><td>File</td><td>9.37 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-12' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-rev-topic.html</span></td><td>File</td><td>9.37 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-13' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-title.html</span></td><td>File</td><td>11.78 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-14' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index-topic.html</span></td><td>File</td><td>12.39 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-15' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>index.html</span></td><td>File</td><td>7.24 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-16' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>iSync-date.html</span></td><td>File</td><td>8.17 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-2-17' data-tt-parent-id='3-2-1-2-3-1-2'><td><span class='file'>iSync-title.html</span></td><td>File</td><td>8 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Carbon</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-1' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Carbon.html</span></td><td>File</td><td>0.21 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-2' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>DesignGuidelines-date.html</span></td><td>File</td><td>9.93 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-3' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>DesignGuidelines-rev-date.html</span></td><td>File</td><td>7.45 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-4' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>DesignGuidelines-rev-revision.html</span></td><td>File</td><td>7.44 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-5' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>DesignGuidelines-rev-title.html</span></td><td>File</td><td>7.45 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-6' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>DesignGuidelines-title.html</span></td><td>File</td><td>9.77 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-7' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-date.html</span></td><td>File</td><td>19.66 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-8' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-rev-date.html</span></td><td>File</td><td>12.35 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-9' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-rev-revision.html</span></td><td>File</td><td>12.33 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-10' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-rev-title.html</span></td><td>File</td><td>12.34 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-11' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-rev-topic.html</span></td><td>File</td><td>12.98 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-12' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-title.html</span></td><td>File</td><td>19.65 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-13' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index-topic.html</span></td><td>File</td><td>22.64 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-14' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>index.html</span></td><td>File</td><td>10.96 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-15' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>IntelBasedMacs-date.html</span></td><td>File</td><td>10.5 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-16' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>IntelBasedMacs-title.html</span></td><td>File</td><td>10.33 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-17' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Performance-date.html</span></td><td>File</td><td>9.14 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-18' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Performance-title.html</span></td><td>File</td><td>8.98 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-19' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Porting-date.html</span></td><td>File</td><td>8.78 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-20' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Porting-title.html</span></td><td>File</td><td>8.63 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-21' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Tools-date.html</span></td><td>File</td><td>16.03 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-22' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Tools-rev-date.html</span></td><td>File</td><td>10.85 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-23' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Tools-rev-revision.html</span></td><td>File</td><td>10.83 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-24' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Tools-rev-title.html</span></td><td>File</td><td>10.84 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-25' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>Tools-title.html</span></td><td>File</td><td>15.88 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-26' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>UserExperience-date.html</span></td><td>File</td><td>8.85 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-3-27' data-tt-parent-id='3-2-1-2-3-1-3'><td><span class='file'>UserExperience-title.html</span></td><td>File</td><td>8.69 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-4' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Cocoa</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-5' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>CoreFoundation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-6' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>css</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-7' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Darwin</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-8' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>DeveloperTools</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-9' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>GraphicsImaging</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-10' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>HardwareDrivers</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-11' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>images</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-12' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-date.html</span></td><td>File</td><td>38.14 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-13' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-rev-date.html</span></td><td>File</td><td>20.91 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-14' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-rev-revision.html</span></td><td>File</td><td>20.89 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-15' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-rev-title.html</span></td><td>File</td><td>20.9 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-16' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-rev-topic.html</span></td><td>File</td><td>45.06 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-17' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-title.html</span></td><td>File</td><td>38.14 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-18' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index-topic.html</span></td><td>File</td><td>77.78 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-19' data-tt-parent-id='3-2-1-2-3-1'><td><span class='file'>index.html</span></td><td>File</td><td>17.08 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-20' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Internationalization</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-21' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>InternetWeb</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-22' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Java</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-23' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>js</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-24' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>LegacyTechnologies</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-25' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>MacOSX</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-26' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>OpenSource</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-27' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Performance</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-28' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Porting</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-29' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Resources</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-30' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>ScriptingAutomation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-31' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>UserExperience</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-1-32' data-tt-parent-id='3-2-1-2-3-1'><td><span class='folder'>Xcode</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>featuredarticles</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-1' data-tt-parent-id='3-2-1-2-3-2'><td><span class='file'>adcstyle.css</span></td><td>File</td><td>15.86 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>AppleApplications</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2-1' data-tt-parent-id='3-2-1-2-3-2-2'><td><span class='file'>idxDashboard-date.html</span></td><td>File</td><td>8.35 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2-2' data-tt-parent-id='3-2-1-2-3-2-2'><td><span class='file'>idxDashboard-title.html</span></td><td>File</td><td>8.24 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2-3' data-tt-parent-id='3-2-1-2-3-2-2'><td><span class='file'>index-date.html</span></td><td>File</td><td>8.52 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2-4' data-tt-parent-id='3-2-1-2-3-2-2'><td><span class='file'>index-title.html</span></td><td>File</td><td>8.51 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2-5' data-tt-parent-id='3-2-1-2-3-2-2'><td><span class='file'>index-topic.html</span></td><td>File</td><td>8.51 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-2-6' data-tt-parent-id='3-2-1-2-3-2-2'><td><span class='file'>index.html</span></td><td>File</td><td>6.46 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-3' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>Carbon</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-4' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>Cocoa</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-5' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>css</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-6' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>DeveloperTools</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-7' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>Games</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-8' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>images</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-9' data-tt-parent-id='3-2-1-2-3-2'><td><span class='file'>index-date.html</span></td><td>File</td><td>16.03 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-10' data-tt-parent-id='3-2-1-2-3-2'><td><span class='file'>index-title.html</span></td><td>File</td><td>16.03 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-11' data-tt-parent-id='3-2-1-2-3-2'><td><span class='file'>index-topic.html</span></td><td>File</td><td>19.32 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-12' data-tt-parent-id='3-2-1-2-3-2'><td><span class='file'>index.html</span></td><td>File</td><td>10.98 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-13' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>js</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-14' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>LegacyTechnologies</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-15' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>ScriptingAutomation</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-2-16' data-tt-parent-id='3-2-1-2-3-2'><td><span class='folder'>UserExperience</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-3' data-tt-parent-id='3-2-1-2-3'><td><span class='file'>index.html</span></td><td>File</td><td>0.23 KB</td></tr>
        <tr data-tt-id='3-2-1-2-3-4' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>qa</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-5' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>reference</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-6' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>referencelibrary</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-7' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>releasenotes</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-8' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>samplecode</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-9' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>technicalnotes</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-10' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>technicalqas</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-2-3-11' data-tt-parent-id='3-2-1-2-3'><td><span class='folder'>technotes</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='3-2-1-3' data-tt-parent-id='3-2-1'><td><span class='file'>version.plist</span></td><td>File</td><td>0.44 KB</td></tr>
        <tr data-tt-id='4'><td><span class='file'>iPhone SDK License.rtf</span></td><td>File</td><td>37.93 KB</td></tr>
        <tr data-tt-id='5'><td><span class='folder'>Perl</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='5-1' data-tt-parent-id='5'><td><span class='folder'>wxPerl</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='5-1-1' data-tt-parent-id='5-1'><td><span class='file'>INSTALL.pod</span></td><td>File</td><td>8.26 KB</td></tr>
        <tr data-tt-id='5-1-2' data-tt-parent-id='5-1'><td><span class='file'>todo.txt</span></td><td>File</td><td>2.3 KB</td></tr>
        <tr data-tt-id='6'><td><span class='folder'>Python</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='6-1' data-tt-parent-id='6'><td><span class='folder'>PyObjC</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='6-1-1' data-tt-parent-id='6-1'><td><span class='file'>announcement.txt</span></td><td>File</td><td>2.33 KB</td></tr>
        <tr data-tt-id='6-1-2' data-tt-parent-id='6-1'><td><span class='file'>api-notes-macosx.html</span></td><td>File</td><td>30.09 KB</td></tr>
        <tr data-tt-id='6-1-3' data-tt-parent-id='6-1'><td><span class='file'>api-notes-macosx.txt</span></td><td>File</td><td>18.37 KB</td></tr>
        <tr data-tt-id='6-1-4' data-tt-parent-id='6-1'><td><span class='file'>C-API.html</span></td><td>File</td><td>11 KB</td></tr>
        <tr data-tt-id='6-1-5' data-tt-parent-id='6-1'><td><span class='file'>C-API.txt</span></td><td>File</td><td>8.67 KB</td></tr>
        <tr data-tt-id='6-1-6' data-tt-parent-id='6-1'><td><span class='file'>coding-style.html</span></td><td>File</td><td>4.53 KB</td></tr>
        <tr data-tt-id='6-1-7' data-tt-parent-id='6-1'><td><span class='file'>coding-style.txt</span></td><td>File</td><td>2.92 KB</td></tr>
        <tr data-tt-id='6-1-8' data-tt-parent-id='6-1'><td><span class='file'>gnustep.html</span></td><td>File</td><td>1.96 KB</td></tr>
        <tr data-tt-id='6-1-9' data-tt-parent-id='6-1'><td><span class='file'>gnustep.txt</span></td><td>File</td><td>1.52 KB</td></tr>
        <tr data-tt-id='6-1-10' data-tt-parent-id='6-1'><td><span class='file'>index.html</span></td><td>File</td><td>2.75 KB</td></tr>
        <tr data-tt-id='6-1-11' data-tt-parent-id='6-1'><td><span class='file'>index.txt</span></td><td>File</td><td>2.64 KB</td></tr>
        <tr data-tt-id='6-1-12' data-tt-parent-id='6-1'><td><span class='file'>intro.html</span></td><td>File</td><td>44.82 KB</td></tr>
        <tr data-tt-id='6-1-13' data-tt-parent-id='6-1'><td><span class='file'>intro.txt</span></td><td>File</td><td>38.38 KB</td></tr>
        <tr data-tt-id='6-1-14' data-tt-parent-id='6-1'><td><span class='file'>protocols.html</span></td><td>File</td><td>3.48 KB</td></tr>
        <tr data-tt-id='6-1-15' data-tt-parent-id='6-1'><td><span class='file'>protocols.txt</span></td><td>File</td><td>2.79 KB</td></tr>
        <tr data-tt-id='6-1-16' data-tt-parent-id='6-1'><td><span class='file'>PyObjCTools.html</span></td><td>File</td><td>10.96 KB</td></tr>
        <tr data-tt-id='6-1-17' data-tt-parent-id='6-1'><td><span class='file'>PyObjCTools.txt</span></td><td>File</td><td>7.9 KB</td></tr>
        <tr data-tt-id='6-1-18' data-tt-parent-id='6-1'><td><span class='folder'>Quartz</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='6-1-18-1' data-tt-parent-id='6-1-18'><td><span class='file'>api-notes.txt</span></td><td>File</td><td>1.47 KB</td></tr>
        <tr data-tt-id='6-1-19' data-tt-parent-id='6-1'><td><span class='file'>release-process.html</span></td><td>File</td><td>3.83 KB</td></tr>
        <tr data-tt-id='6-1-20' data-tt-parent-id='6-1'><td><span class='file'>release-process.txt</span></td><td>File</td><td>2.65 KB</td></tr>
        <tr data-tt-id='6-1-21' data-tt-parent-id='6-1'><td><span class='file'>structure.html</span></td><td>File</td><td>6.55 KB</td></tr>
        <tr data-tt-id='6-1-22' data-tt-parent-id='6-1'><td><span class='file'>structure.txt</span></td><td>File</td><td>5.1 KB</td></tr>
        <tr data-tt-id='6-1-23' data-tt-parent-id='6-1'><td><span class='file'>TODO.html</span></td><td>File</td><td>13.49 KB</td></tr>
        <tr data-tt-id='6-1-24' data-tt-parent-id='6-1'><td><span class='file'>TODO.txt</span></td><td>File</td><td>9.06 KB</td></tr>
        <tr data-tt-id='6-1-25' data-tt-parent-id='6-1'><td><span class='folder'>tutorial</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='6-1-26' data-tt-parent-id='6-1'><td><span class='folder'>tutorial_embed</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='6-1-27' data-tt-parent-id='6-1'><td><span class='file'>tutorial_reading.html</span></td><td>File</td><td>12.85 KB</td></tr>
        <tr data-tt-id='6-1-28' data-tt-parent-id='6-1'><td><span class='file'>tutorial_reading.txt</span></td><td>File</td><td>11.12 KB</td></tr>
        <tr data-tt-id='6-1-29' data-tt-parent-id='6-1'><td><span class='file'>website.lst</span></td><td>File</td><td>0.58 KB</td></tr>
        <tr data-tt-id='6-1-30' data-tt-parent-id='6-1'><td><span class='file'>wrapping.html</span></td><td>File</td><td>6.04 KB</td></tr>
        <tr data-tt-id='6-1-31' data-tt-parent-id='6-1'><td><span class='file'>wrapping.txt</span></td><td>File</td><td>5.2 KB</td></tr>
        <tr data-tt-id='6-1-32' data-tt-parent-id='6-1'><td><span class='folder'>xcode</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='6-1-33' data-tt-parent-id='6-1'><td><span class='file'>Xcode-Templates.html</span></td><td>File</td><td>13.97 KB</td></tr>
        <tr data-tt-id='6-2' data-tt-parent-id='6'><td><span class='folder'>wxPython</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='7'><td><span class='folder'>RubyCocoa</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='8'><td><span class='folder'>wxWidgets</span></td><td>Folder</td><td>--</td></tr>
        <tr data-tt-id='9'><td><span class='file'>Xcode Tools License.rtf</span></td><td>File</td><td>18.79 KB</td></tr>
        </tbody>
    </table>

      <pre class="listing">
$("#tree_ed").treetable({ expandable: true });

// Highlight selected row
$("#tree_ed tbody").on("mousedown", "tr", function() {
  $(".selected").not(this).removeClass("selected");
  $(this).toggleClass("selected");
});

// Drag & Drop Example Code
$("#tree_ed .file, #tree_ed .folder").draggable({
  helper: "clone",
  opacity: .75,
  refreshPositions: true,
  revert: "invalid",
  revertDuration: 300,
  scroll: true
});

$("#tree_ed .folder").each(function() {
  $(this).parents("#tree_ed tr").droppable({
    accept: ".file, .folder",
    drop: function(e, ui) {
      var droppedEl = ui.draggable.parents("tr");
      $("#tree_ed").treetable("move", droppedEl.data("ttId"), $(this).data("ttId"));
    },
    hoverClass: "accept",
    over: function(e, ui) {
      var droppedEl = ui.draggable.parents("tr");
      if(this != droppedEl[0] && !$(this).is(".expanded")) {
        $("#tree_ed").treetable("expandNode", $(this).data("ttId"));
      }
    }
  });
});</pre>

    <h3>AJAX enabled D&D example</h3>

    <p>See <a href="https://github.com/ludo/jquery-treetable-ajax-example">https://github.com/ludo/jquery-treetable-ajax-example</a>.</p>

    <h3>Using treetable with PersistJS</h3>

    <p>See <a href="https://github.com/jughead/jquery-treetable-ajax-persist">https://github.com/jughead/jquery-treetable-ajax-persist</a>.</p>
</div>

<script src="asset/js/jquery.js"></script>
<script src="asset/js/jquery.ui.core.js"></script>
<script src="asset/js/jquery.ui.widget.js"></script>
<script src="asset/js/jquery.ui.mouse.js"></script>
<script src="asset/js/jquery.ui.draggable.js"></script>
<script src="asset/js/jquery.ui.droppable.js"></script>
<script src="asset/js/jquery.treetable.js"></script>
<script>
    $("#example-basic").treetable({ expandable: true });

    $("#example-basic-static").treetable();

    $("#example-basic-expandable").treetable({ expandable: true });

    $("#tree_ed").treetable({ expandable: true });

    // Highlight selected row
    $("#tree_ed tbody").on("mousedown", "tr", function() {
        $(".selected").not(this).removeClass("selected");
        $(this).toggleClass("selected");
    });

    // Drag & Drop Example Code
    $("#tree_ed .file, #tree_ed .folder").draggable({
        helper: "clone",
        opacity: .75,
        refreshPositions: true, // Performance?
        revert: "invalid",
        revertDuration: 300,
        scroll: true
    });

    $("#tree_ed .folder").each(function() {
        $(this).parents("#tree_ed tr").droppable({
            accept: ".file, .folder",
            drop: function(e, ui) {
                var droppedEl = ui.draggable.parents("tr");
                $("#tree_ed").treetable("move", droppedEl.data("ttId"), $(this).data("ttId"));
            },
            hoverClass: "accept",
            over: function(e, ui) {
                var droppedEl = ui.draggable.parents("tr");
                if(this != droppedEl[0] && !$(this).is(".expanded")) {
                    $("#tree_ed").treetable("expandNode", $(this).data("ttId"));
                }
            }
        });
    });

    $("form#reveal").submit(function() {
        var nodeId = $("#revealNodeId").val()

        try {
            $("#tree_ed").treetable("reveal", nodeId);
        }
        catch(error) {
            alert(error.message);
        }

        return false;
    });
</script>
</body>
</html>