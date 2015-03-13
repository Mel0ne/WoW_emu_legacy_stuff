{strip}

{assign var="category" value=false}

{foreach from=$data item=curr}
	{if $curr.category}{assign var="category" value=true}{/if}
{/foreach}

	new Listview({ldelim}
		template:'achievement',
		id:'{$id}',
		note:'{#Achievements_found#}',
		{if isset($name)}name:LANG.tab_{$name},{/if}
		{if isset($tabsid)}tabs:{$tabsid}, parent:'listview-generic',{/if}
		{if $category}visibleCols:['category'],{/if}
		data:[
			{section name=i loop=$data}
				{ldelim}
					{assign var="achievement_id" value=$data[i].id}
					id:{$data[i].id},
					{* Название достижения *}
					name:'{php}
					$loc = $this->_tpl_vars['locale'];
					$achievement_id = $this->_tpl_vars['achievement_id'];
					mysql_select_db("world");
					$request = mysql_query("SELECT name_loc$loc FROM aowow_achievement WHERE id='$achievement_id'");
					$request = mysql_fetch_row($request);
					$request = $request[0];
					echo $request;
					{/php}',
					{* Описание достижения *}
					description:'					
					{php}
					$loc = $this->_tpl_vars['locale'];
					$achievement_id = $this->_tpl_vars['achievement_id'];
					$request = mysql_query("SELECT description_loc$loc FROM aowow_achievement WHERE id='$achievement_id'");
					$request = mysql_fetch_row($request);
					$request = $request[0];
					echo $request;
					{/php}',
					{* Стороны *}
					side:{$data[i].faction},
					{* Очки *}
					points:{$data[i].points},
					{if $data[i].areatableID}
						zone:{$data[i].areatableID},
					{/if}
					category:{$data[i].category}					
				{rdelim}
				{if $smarty.section.i.last}{else},{/if}
			{/section}
		]
	{rdelim});
{/strip}