{include file='header.tpl'}
		<div id="main">

			<div id="main-precontents"></div>
			<div id="main-contents" class="main-contents">
				<table class="infobox">
					<tr><th>{#Quick_Facts#}</th></tr>
					<tr><td>
						<div class="infobox-spacer"></div>
						<ul>
							<li><div>{#Joined#}: {$user.joined}</div></li>
							<li><div>{#Lastvisit#}: {$user.llogin}</div></li>
							<li><div>{#Reputation#}: {$reputation.totalrep}</div></li>
						</ul>
					</td></tr>
				</table>

				<div class="text">
					<div class="h1-icon">
<div class="iconmedium">
<ins style='background-image: url("/images/icons/medium/ability_warrior_innerrage.jpg");'></ins>
<del></del>
</div>
</div>
					<h1>{$user.profilename}'s Profile</h1>
					
					<div id="efhjkdsoicjx" class="left">
					{if $event.exdescimg == NULL}{else}<img alt="" style="float: right; margin: 0 0 10px 10px" src="/images/events/{$event.exdescimg}" width="35%">{/if}
					{$event.exdesc}
					</div>

					<h2>{#Related#}</h2>
				</div>

				{include file='bricks/user/reputation.tpl'}

		</div>
{include file='footer.tpl'}