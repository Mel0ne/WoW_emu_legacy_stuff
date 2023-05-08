{php}
include("/configs/events.php");
$holliday = date("m/d");
$lunar = array("01/22","01/23","01/24","01/25","01/26","01/27","01/28","01/29","01/30","01/31","02/01","02/02","02/03","02/04","02/05","02/06","02/07","02/08","02/09","02/10","02/11");
$love = array("02/05","02/06","02/07","02/08","02/09","02/10","02/11","02/12","02/13","02/14","02/15","02/16","02/17","02/18","02/19","02/20");
$noblegarden = array("04/08","04/09","04/10","04/11","04/12","04/13","04/14","04/15");
$cweek = array("04/29","04/30","05/01","05/02","05/03","05/04","05/05","05/06");
$midsummer = array("06/21","06/22","06/23","06/24","06/25","06/26","06/27","06/28","06/29","06/30","07/01","07/02","07/03","07/04","07/05");
$fireworks = array("07/04");
$pirates = array("09/19","09/20");
$harvest = array("09/24","09/25","09/26","09/27","09/28","09/29","09/30");
$brewfest = array("09/28","09/29","09/30","10/01","10/02","10/03","10/04","10/05","10/06","10/07","10/08","10/09","10/10","10/11","10/12","10/13");
$hallowsend = array("10/18","10/19","10/20","10/21","10/22","10/23","10/24","10/25","10/26","10/27","10/28","10/29","10/30","10/31");
$dod = array("11/01","11/02");
$bounty = array("11/18","11/19","11/20","11/21","11/22","11/23","11/24","11/25");
$winterveil = array("12/15","12/16","12/17","12/18","12/19","12/20","12/21","12/22","12/23","12/24","12/25","12/26","12/27","12/28","12/29","12/30","12/31","01/01","01/02");
$this->assign('holliday', $holliday);
$this->assign('lunar', $lunar);
$this->assign('love', $love);
$this->assign('noblegarden', $noblegarden);
$this->assign('cweek', $cweek);
$this->assign('midsummer', $midsummer);
$this->assign('fireworks', $fireworks);
$this->assign('pirates', $pirates);
$this->assign('harvest', $harvest);
$this->assign('brewfest', $brewfest);
$this->assign('hallowsend', $hallowsend);
$this->assign('dod', $dod);
$this->assign('bounty', $bounty);
$this->assign('winterveil', $winterveil);
{/php}
{if in_array($holliday, $winterveil)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-winterveil-{php} $number = rand(1,2); echo $number; $this->assign('winterveil_image_number', $number);{/php}.png)" id="home-featuredbox">
{if $winterveil_image_number == 1}
<div class="home-featuredbox-links">
<a href="{php} echo $winter_event; {/php}" title="{#Winter_veil#}" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="/quests" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
{else}
{* Тут вы можете указать ссылки на нужные вам квесты (ну что бы подходило к картинке) *}
<div class="home-featuredbox-links">
<a href="{php} echo $winter_event; {/php}" title="{#Winter_veil#}" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="/giveaway" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
{/if}
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $lunar)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-lunarfestival.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $lunar_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $love)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-loveisintheair.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $love_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $noblegarden)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $noblegarden_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $cweek)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $cweek_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $midsummer)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $midsummer_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $fireworks)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $fireworks_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $pirates)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $pirates_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $harvest)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $harvest_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $brewfest)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $brewfest_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $hallowsend)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $hallowsend_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $dod)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $dod_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{elseif in_array($holliday, $bounty)}
<div class="home-featuredbox home-featuredbox-extended" style="background-image: url(/images/home/featured/featurebox-.png)" id="home-featuredbox">
<div class="home-featuredbox-links">
<a href="{php} echo $bounty_event; {/php}" title="" style="left: 211px; top: 22px; width:190px; height: 158px"></a>
<var style="left: 211px; top: 22px; width:190px; height: 158px"></var>
<a href="" title="" style="left: 400px; top: 22px; width:110px; height: 158px"></a>
<var style="left: 400px; top: 22px; width:110px; height: 158px"></var>
</div>
<div class="home-featuredbox-inner text" id="lkdngndfgndf52">
{if $news}
				<ul>
					{foreach from=$news item=item}
						<li><div>{$item.text}</div></li>
					{/foreach}
				</ul>
{/if}
</div>
</div>
{else}
{if $news}
		<div class="news">
			<div class="news-list text">
				<ul>
{foreach from=$news item=item}
					<li><div>{$item.text}</div></li>
{/foreach}
				</ul>
			</div>
		</div>
{/if}
{/if}
