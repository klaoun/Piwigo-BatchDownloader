{combine_css path=$BATCH_DOWNLOAD_PATH|@cat:"admin/template/style.css"}

<div class="titrePage">
	<h2>Batch Downloader</h2>
</div>

<form class="filter" method="post" name="filter" action="{$F_FILTER_ACTION}">
<fieldset>
  <legend>{'Filter'|@translate}</legend>
  <input type="hidden" name="page" value="user_list">

  <label>{'Username'|@translate} <input type="text" name="username" value="{$F_USERNAME}"></label>

  <label>
  {'Set type'|@translate}
  {html_options name=type options=$type_options selected=$type_selected}
  </label>
  
  <label>
  {'Status'|@translate}
  {html_options name=status options=$status_options selected=$status_selected}
  </label>

  <label>
  {'Sort by'|@translate}
  {html_options name=order_by options=$order_options selected=$order_selected}
  </label>

  <label>
  {'Sort order'|@translate}
  {html_options name=direction options=$direction_options selected=$direction_selected}
  </label>

  <label>
  &nbsp;
  <span><input class="submit" type="submit" name="filter" value="{'Submit'|@translate}"> <a href="{$F_FILTER_ACTION}">{'Reset'|@translate}</a></span>
  </label>

</fieldset>

</form>

<table class="table2" width="97%">
  <thead>
    <tr class="throw">
      <td class="user">{'Username'|@translate}</td>
      <td class="type">{'Set type'|@translate}</td>
      <td class="date">{'Creation date'|@translate}</td>
      <td class="size">{'Total size'|@translate}</td>
      <td class="images">{'Nb images'|@translate}</td>
      <td class="archives">{'Nb archives'|@translate}</td>
      <td class="status">{'Status'|@translate}</td>
      <td class="action">{'Actions'|@translate}</td>
    </tr>
  </thead>

  {foreach from=$sets item=set name=sets_loop}
  <tr class="{if $smarty.foreach.sets_loop.index is odd}row1{else}row2{/if}">
    <td>{$set.USERNAME}</td>
    <td>{$set.NAME}</td>
    <td style="text-align:center;">{$set.DATE_CREATION}</td>
    <td>{$set.TOTAL_SIZE} MB</td>
    <td>{$set.NB_IMAGES}</td>
    <td>{$set.NB_ARCHIVES}</td>
    <td>
      {$set.STATUS}
      {if $set.STATUS == 'download'}({$set.LAST_ZIP}/{$set.NB_ARCHIVES}){/if}
    </td>
    <td style="padding-left:25px;">
      <a href="{$set.U_DELETE}" title="{'Delete this set'|@translate}" onClick="return confirm('{'Are your sure?'|@translate}');"><img src="admin/themes/default/icon/delete.png"></a>
      {if $set.STATUS != 'done'}<a href="{$set.U_CANCEL}" title="{'Cancel this set'|@translate}" onClick="return confirm('{'Are your sure?'|@translate}');"><img src="admin/themes/default/icon/permissions.png"></a>{/if}
    </td>
  </tr>
  {/foreach}
  
  {if not $sets}
  <tr class="row2">
    <td colspan="8" style="text-align:center;font-style:italic;">{'No result'|@translate}</td>
  </tr>
  {/if}
</table>