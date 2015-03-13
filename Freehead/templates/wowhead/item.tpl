{include file='header.tpl'}

		<div id="main">

			<div id="main-precontents"></div>
			<div id="main-contents" class="main-contents">

				<script type="text/javascript">
					{include file='bricks/allcomments.tpl'}
					{include file='bricks/allscreenshots.tpl'}
					var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeid}, name: '{$item.name|escape:"quotes"}'{rdelim};
					g_initPath({$page.path});
				</script>
				

				<table class="infobox">
					<tr><th>{#Quick_Facts#}</th></tr>
					<tr><td>
						<div class="infobox-spacer"></div>
						<ul>
							{* Трансмогрификация *}
							<li><div>{if $item.quality <=4}{#Can_be_transm#}{elseif $item.quality >=5}{#Cannot_be_transm#}{/if}
							{* Уровень вещи *}
							{if $item.level}<li><div>{#level#}: {$item.level}</div></li>{/if}
							{* Стоимость вещи *}
							{if $item.buygold or $item.buysilver or $item.buycopper}
								<li><div>
									{#Buy_for#}:
									{if $item.buygold}<span class="moneygold">{$item.buygold}</span>{/if}
									{if $item.buysilver}<span class="moneysilver">{$item.buysilver}</span>{/if}
									{if $item.buycopper}<span class="moneycopper">{$item.buycopper}</span>{/if}
								</div></li>
							{/if}
							{if $item.sellgold or $item.sellsilver or $item.sellcopper}
								<li><div>
									{#Sells_for#}:
									{if $item.sellgold}<span class="moneygold">{$item.sellgold}</span>{/if}
									{if $item.sellsilver}<span class="moneysilver">{$item.sellsilver}</span>{/if}
									{if $item.sellcopper}<span class="moneycopper">{$item.sellcopper}</span>{/if}
								</div></li>
							{/if}
							{if isset($item.disenchantskill)}<li><div>{#Disenchantable#} (<span class="tip" onmouseover="Tooltip.showAtCursor(event, LANG.tooltip_reqenchanting, 0, 0, 'q')" onmousemove="Tooltip.cursorUpdate(event)" onmouseout="Tooltip.hide()">{$item.disenchantskill}</span>)</div></li>{/if}
							{if isset($item.key)}<li><div>{#Can_be_placed_in_the_keyring#}</div></li>{/if}
							<li><div>{#Added_in_patch#} {if $item.WDBVerified == 5875}1.12.1{elseif $item.WDBVerified == 6005}1.12.2{elseif $item.WDBVerified == 8606}2.4.3{elseif $item.WDBVerified == 9947}3.1.3{elseif $item.WDBVerified == 10146}3.2.0{elseif $item.WDBVerified == 10505}3.2.2a{elseif $item.WDBVerified == 10571}3.3.0{elseif $item.WDBVerified == 11159}3.3.0a{elseif $item.WDBVerified == 11403}3.3.2{elseif $item.WDBVerified == 11623}3.3.3{elseif $item.WDBVerified == 11723}3.3.3a{elseif $item.WDBVerified == 12340}3.3.5a{/if} </div></li>
						</ul>
						<tr><th id="infobox-">{#Screenshots_tab#}</th></tr>
<tr><td><div class="infobox-spacer"></div><center><div id="infobox-sticky-ss"></div></center></td></tr>
					</td></tr>
				</table>

				<div class="text">
					{strip}
					<a href="javascript:;" class="button-red" onclick="this.blur(); g_getIngameLink(
						{if $item.quality==0}
							'ff9d9d9d',
						{elseif $item.quality==1}
							'ffffffff',
						{elseif $item.quality==2}
							'ff1eff00',
						{elseif $item.quality==3}
							'ff0070dd',
						{elseif $item.quality==4}
							'ffa335ee',
						{elseif $item.quality==5}
							'ffff8000',
						{elseif $item.quality==6}
							'ffe5cc80',
						{elseif $item.quality==7}
							'ffe5cc80',
						{elseif $item.quality==8}
							'ffffff98',
						{else}
							'ff71d5ff',
						{/if}
						'item:{$item.entry}:0:0:0:0:0:0:0:0', '{$item.name|replace:'"':'\\\\&quot;'}')">
					<em><b><i>Link</i></b><span>{#Game_link#}</span></em></a>
					<a href="javascript:;" class="button-red" onclick="this.blur(); g_getBBCodeLink(
						{if $item.quality==0}
							'#9d9d9d',
						{elseif $item.quality==1}
							'#ffffff',
						{elseif $item.quality==2}
							'#1eff00',
						{elseif $item.quality==3}
							'#0070dd',
						{elseif $item.quality==4}
							'#a335ee',
						{elseif $item.quality==5}
							'#FF8000',
						{elseif $item.quality==6}
							'#e5cc80',
						{elseif $item.quality==7}
							'#e5cc80',
						{elseif $item.quality==8}
							'#ffff98',
						{else}
							'#71d5ff',
						{/if}
						'{$item.entry}', '{$item.name|replace:'"':'\\&quot;'}')">
					<em><b><i>Link</i></b><span>{#Forum_link#}</span></em></a>
					<a href="javascript:;" id="dsgndslgn464d" class="button-red" onclick="this.blur(); ModelViewer.show({ldelim} type: {$page.type}, typeId: {$item.entry}, displayId: {$item.displayid}, slot: {$item.type}{rdelim})"><em><b><i>{#Viewer_3D#}</i></b><span>{#Viewer_3D#}</span></em></a>

					{/strip}
					
					<a href="http://{if $locale == 8}ru{elseif $locale == 0}www{elseif $locale == 6}es{/if}.wowhead.com/{$query}" class="button-red"><em><b><i>Wowhead</i></b><span>Wowhead</span></em></a>
					<h1>{$item.name}</h1>

					<div id="icon{$item.entry}-generic" style="float: left"></div>
					<div id="tooltip{$item.entry}-generic" class="tooltip" style="float: left; padding-top: 1px">
					<table><tr><td>{$item.info}</td><th style="background-position: top right"></th></tr><tr><th style="background-position: bottom left"></th><th style="background-position: bottom right"></th></tr></table>
					</div>

					<div style="clear: left"></div>

					<script type="text/javascript">
						ge('icon{$item.entry}-generic').appendChild(Icon.create('{$item.iconname}', 2, 0, 0, {$item.stackable}));
						Tooltip.fix(ge('tooltip{$item.entry}-generic'), 1, 1);
					</script>
					
					<h2>{#Related#}</h2>

				</div>

				<div id="tabs-generic"></div>
				<div id="listview-generic" class="listview"></div>
<script type="text/javascript">
var tabsRelated = new Tabs({ldelim}parent: ge('tabs-generic'){rdelim});
{if isset($item.unlocks)}{include				file='bricks/object_table.tpl'			id='unlocks'				tabsid='tabsRelated' data=$item.unlocks				name='unlocks'			}{/if}
{if isset($item.fishedin)}{include				file='bricks/zone_table.tpl'			id='fished-in'				tabsid='tabsRelated' data=$item.fishedin			name='fishedin'			}{/if}
{if isset($item.droppedby)}{include				file='bricks/creature_table.tpl'		id='dropped-by'				tabsid='tabsRelated' data=$item.droppedby			name='droppedby'		}{/if}
{if isset($item.soldby)}{include				file='bricks/creature_table.tpl'		id='sold-by'				tabsid='tabsRelated' data=$item.soldby				name='soldby'			}{/if}
{if isset($item.currencyfor)}{include				file='bricks/item_table.tpl'			id='currency-for'			tabsid='tabsRelated' data=$item.currencyfor			name='currencyfor'		}{/if}
{if isset($item.teaches)}{include				file='bricks/spell_table.tpl'			id='teaches-recipe'			tabsid='tabsRelated' data=$item.teaches				name='teaches'			}{/if}
{if isset($item.containedinobject)}{include		file='bricks/object_table.tpl'			id='contained-in-object'	tabsid='tabsRelated' data=$item.containedinobject	name='containedin'		}{/if}
{if isset($item.minedfromobject)}{include		file='bricks/object_table.tpl'			id='mined-from-object'		tabsid='tabsRelated' data=$item.minedfromobject		name='minedfrom'		}{/if}
{if isset($item.gatheredfromobject)}{include	file='bricks/object_table.tpl'			id='gathered-from-object'	tabsid='tabsRelated' data=$item.gatheredfromobject	name='gatheredfrom'		}{/if}
{if isset($item.containedinitem)}{include		file='bricks/item_table.tpl'			id='contained-in-item'		tabsid='tabsRelated' data=$item.containedinitem		name='containedin'		}{/if}
{if isset($item.contains)}{include				file='bricks/item_table.tpl'			id='contains'				tabsid='tabsRelated' data=$item.contains			name='contains'			}{/if}
{if isset($item.pickpocketingloot)}{include		file='bricks/creature_table.tpl'		id='pick-pocketed-from'		tabsid='tabsRelated' data=$item.pickpocketingloot	name='pickpocketedfrom'	}{/if}
{if isset($item.skinnedfrom)}{include			file='bricks/creature_table.tpl'		id='skinned-from'			tabsid='tabsRelated' data=$item.skinnedfrom			name='skinnedfrom'		}{/if}
{if isset($item.prospecting)}{include		file='bricks/item_table.tpl'			id='prospecting'		tabsid='tabsRelated' data=$item.prospecting		name='prospecting'	}{/if}
{if isset($item.prospectingloot)}{include		file='bricks/item_table.tpl'			id='prospected-from'		tabsid='tabsRelated' data=$item.prospectingloot		name='prospectedfrom'	}{/if}
{if isset($item.canbeplacedin)}{include			file='bricks/item_table.tpl'			id='can-be-placed-in'		tabsid='tabsRelated' data=$item.canbeplacedin		name='canbeplacedin'	}{/if}
{if isset($item.providedfor)}{include			file='bricks/quest_table.tpl'			id='provided-for'			tabsid='tabsRelated' data=$item.providedfor			name='providedfor'		}{/if}
{if isset($item.objectiveof)}{include			file='bricks/quest_table.tpl'			id='objective-of'			tabsid='tabsRelated' data=$item.objectiveof			name='objectiveof'		}{/if}
{if isset($item.starts)}{include				file='bricks/quest_table.tpl'			id='starts'					tabsid='tabsRelated' data=$item.starts				name='starts'			}{/if}
{if isset($item.rewardof)}{include				file='bricks/quest_table.tpl'			id='reward-of'				tabsid='tabsRelated' data=$item.rewardof			name='rewardfrom'		}{/if}
{if isset($item.reagentfor)}{include			file='bricks/spell_table.tpl'			id='reagent-for'			tabsid='tabsRelated' data=$item.reagentfor			name='reagentfor'		}{/if}
{if isset($item.createdfrom)}{include			file='bricks/spell_table.tpl'			id='created-by'				tabsid='tabsRelated' data=$item.createdfrom			name='createdby'		}{/if}
{if isset($item.disenchanting)}{include			file='bricks/item_table.tpl'			id='disenchanting'			tabsid='tabsRelated' data=$item.disenchanting		name='disenchanting'	}{/if}
{if isset($item.disenchantedfrom)}{include		file='bricks/item_table.tpl'			id='disenchanting'			tabsid='tabsRelated' data=$item.disenchantedfrom	name='disenchantedfrom'	}{/if}
{if isset($item.milling)}{include				file='bricks/item_table.tpl'			id='milling'				tabsid='tabsRelated' data=$item.milling				name='milling'			}{/if}
{if isset($item.milledfrom)}{include			file='bricks/item_table.tpl'			id='milling'				tabsid='tabsRelated' data=$item.milledfrom			name='milledfrom'		}{/if}
{if isset($item.criteria_of)}{include 			file='bricks/achievement_table.tpl' 	id='criteria-of'			tabsid='tabsRelated' data=$item.criteria_of			name='criteriaof'		}{/if}
new Listview({ldelim}template: 'comment', id: 'comments', name: LANG.tab_comments, tabs: tabsRelated, parent: 'listview-generic', data: lv_comments{rdelim});
new Listview({ldelim}template: 'screenshot', id: 'screenshots', name: LANG.tab_screenshots, tabs: tabsRelated, parent: 'listview-generic', data: lv_screenshots{rdelim});
tabsRelated.flush();
ss_appendSticky();
</script>


				{include file='bricks/contribute.tpl'}
			</div>
		</div>

{include file='footer.tpl'}