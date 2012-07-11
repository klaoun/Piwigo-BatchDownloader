{combine_css path=$BATCH_DOWNLOAD_PATH|@cat:"template/style.css"}

{if $set.U_DOWNLOAD}
{footer_script}
setTimeout("document.location.href = '{$set.U_DOWNLOAD}';", 1000);
{/footer_script}
{/if}

{if $themeconf.name != "stripped" and $themeconf.parent != "stripped" and $themeconf.name != "simple-grey" and $themeconf.parent != "simple"}
  {$MENUBAR}
{else}
  {assign var="intern_menu" value="true"}
{/if}
<div id="content" class="content{if isset($MENUBAR)} contentWithMenu{/if}">
{if $intern_menu}{$MENUBAR}{/if}

<div class="titrePage">
  <ul class="categoryActions"></ul>
  <h2>{$TITLE}</h2>
</div>{* <!-- titrePage --> *}

{if isset($errors) or not empty($infos)}
{include file='infos_errors.tpl'}
{/if}


{if $set}
<fieldset>
  <legend>{'Download info'|@translate}</legend>
  <h2>{$set.NAME}</h2>
  {if $set.COMMENT}<blockquote class="comment">{$set.COMMENT}</blockquote>{/if}
  
  <ul class="set-infos">
    <li class="error">{$elements_error}</li>
    <li><b>{'%d photos'|@translate|@sprintf:$set.NB_IMAGES}</b>{if $set.U_EDIT_SET}, <a href="{$set.U_EDIT_SET}" rel="nofollow">{'Edit the set'|@translate}</a>{/if}</li>
    <li><b>{'Estimated size'|@translate}:</b> {$set.TOTAL_SIZE} MB</li>
    <li><b>{'Estimated number of archives'|@translate}:</b> {$set.NB_ARCHIVES} <i>({'real number of archives can differ'|@translate})</i></li>
    <li><b>{'Created on'|@translate}:</b> {$set.DATE_CREATION}</li>
  </ul>
</fieldset>

<fieldset>
  <legend>{'Download links'|@translate}</legend>
  
  <ul class="download-links">
    {$set.LINKS}
    <li class="warning">{'<b>Warning:</b> all files will be deleted within %d hours'|@translate|@sprintf:$archive_timeout}</li>
  </ul>
  
  <a href="{$set.U_CANCEL}" class="cancel-down" onClick="return confirm('{'Are you sure?'|@translate}');">{'Cancel this download'|@translate}</a>
</fieldset>
{/if}

</div>{* <!-- content --> *}