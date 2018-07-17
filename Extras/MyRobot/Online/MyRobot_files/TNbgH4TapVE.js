/*!CK:4097230528!*//*1405924481,*/

if (self.CavalryLogger) { CavalryLogger.start_js(["a7RDT"]); }

__d("SubscriptionLevels",[],function(a,b,c,d,e,f){var g={ALL:'162318810514679',DEFAULT:'271670892858696',TOP:'266156873403755'};e.exports=g;},null);
__d("EditSubscriptions",["Arbiter","AsyncRequest","CSS","DOM","Event","FeedBlacklistButton","MenuDeprecated","Parent","SubscriptionLevels","arrayContains","cx","ge"],function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r){var s=45,t=[o.ALL,o.DEFAULT,o.TOP],u={},v={},w={},x={},y={},z={},aa={},ba={},ca={},da={},ea={},fa="/ajax/follow/follow_profile.php",ga="/ajax/follow/unfollow_profile.php",ha="/ajax/settings/notifications/notify_me.php",ia={},ja={},ka=null,la=false,ma={};function na(kb){return p(t,kb);}function oa(kb,lb,mb,nb){var ob=n.byClass(nb,'uiMenuItem')||n.byClass(nb,"_54ni"),pb=j.getID(kb);if(!ob||!j.contains(kb,ob)){return;}else if(i.hasClass(ob,'SubscribeMenuSubscribeCheckbox')){if(w[lb]){sa(pb,lb);}else ra(pb,lb);return false;}else if(i.hasClass(ob,'SubscribeMenuUnsubscribe')){sa(pb,lb);return false;}else if(i.hasClass(ob,'SubscribeMenuSettingsItem')){eb(kb,true);return false;}else if(i.hasClass(ob,'SubscriptionMenuGoBack')){eb(kb,false);return false;}else if(i.hasClass(ob,'SubscriptionMenuItem')){pa(kb,lb,mb,ob);return false;}else if(i.hasClass(ob,'SubscribeMenuNotifyMeCheckbox')){if(x[lb]){ib(kb,lb);}else hb(kb,lb);return false;}}function pa(kb,lb,mb,nb){if(i.hasClass(nb,'SubscriptionMenuLevel')){if(m.isItemChecked(nb))return;cb(kb,lb,va(nb),true,mb);}else if(i.hasClass(nb,'SubscriptionMenuCategory')){za(lb,nb,!m.isItemChecked(nb),true,mb);}else if(i.hasClass(nb,'SubscriptionAppStory'))bb(lb,nb,!m.isItemChecked(nb),mb);}function qa(kb){return ma[kb]?ma[kb]:0;}function ra(kb,lb){var mb={profile_id:lb};g.inform('FollowingUser',mb);g.inform(l.UNBLACKLIST,mb);new h().setURI(fa).setMethod('POST').setData({profile_id:lb,location:qa(kb)}).setErrorHandler(g.inform.bind(null,'FollowUserFail',mb)).send();}function sa(kb,lb){var mb={profile_id:lb};g.inform('UnfollowingUser',mb);g.inform(l.BLACKLIST,mb);new h().setURI(ga).setMethod('POST').setData({profile_id:lb,location:qa(kb)}).setErrorHandler(g.inform.bind(null,'UnfollowUserFail',mb)).send();}function ta(kb,lb,mb){var nb={profile_id:kb,level:ba[kb],custom_categories:ca[kb],location:mb};new h().setURI('/ajax/follow/manage_subscriptions.php').setData(nb).send();}function ua(kb,lb){var mb=ca[lb]||[],nb=m.getItems(kb);nb.forEach(function(ob){if(i.hasClass(ob,'SubscriptionMenuCategory')){var pb=va(ob);if(p(mb,pb)){xa(ob);}else ya(ob);}else if(i.hasClass(ob,'SubscriptionAppStory')){var qb=va(ob);if(ja[lb]&&ja[lb][qb]){xa(ob);}else ya(ob);}});cb(kb,lb,ba[lb],false);}function va(kb){var lb=j.scry(kb,'input')[0];return lb&&lb.value;}function wa(kb){return j.find(kb,'a.itemAnchor');}function xa(kb){i.addClass(kb,'checked');wa(kb).setAttribute('aria-checked',true);}function ya(kb){i.removeClass(kb,'checked');wa(kb).setAttribute('aria-checked',false);}function za(kb,lb,mb,nb,ob){if(mb){xa(lb);}else ya(lb);var pb=va(lb);if(na(pb)){mb&&ab(kb,pb);}else if(mb){if(!p(ca[kb],pb))ca[kb].push(pb);}else{var qb=ca[kb].indexOf(pb);if(qb!==-1)ca[kb].splice(qb,1);}if(nb)ta(kb,pb,ob);}function ab(kb,lb){ba[kb]=lb;g.inform('SubscriptionLevelUpdated',{profile_id:kb,level:lb});}function bb(kb,lb,mb,nb){var ob='/ajax/feed/filter_action/',pb=va(lb),qb={actor_id:kb,app_id:pb};if(mb){xa(lb);ob+='resubscribe_user_app/';qb.action='resubscribe_user_app';if(!ja[kb])ja[kb]={};ja[kb][pb]=true;}else{ya(lb);ob+='unsubscribe_user_app_checkbox/';qb.action='unsubscribe_user_app_checkbox';if(ja[kb])ja[kb][pb]=false;}new h().setURI(ob).setData(qb).send();}function cb(kb,lb,mb,nb,ob){var pb=j.scry(kb,'.SubscriptionMenuLevel'),qb=null;pb.forEach(function(rb){if(va(rb)==mb){qb=rb;}else if(m.isItemChecked(rb))za(lb,rb,false,false);});qb&&za(lb,qb,true,nb,ob);}function db(kb,lb,mb){w[lb]=mb;i.conditionClass(kb,'isUnsubscribed',!mb);var nb=j.scry(kb,'li.SubscribeMenuSubscribeCheckbox');if(nb.length!==0){var ob=nb[0];if(mb){xa(ob);}else ya(ob);}}function eb(kb,lb){i.conditionClass(kb,'subscriptionMenuOpen',lb);}function fb(kb,lb,mb){var nb=j.find(kb,".FriendListSubscriptionsMenu"),ob=j.find(nb,".uiMenuInner");if(ka!=null)ka.forEach(function(pb){ob.removeChild(pb);});mb.forEach(function(pb){ob.appendChild(pb);});ka=mb;}g.subscribe('UnfollowUser',function(kb,lb){if(da[lb.profile_id]){ab(lb.profile_id,da[lb.profile_id]);ca[lb.profile_id]=ea[lb.profile_id].slice();}});g.subscribe('UpdateSubscriptionLevel',function(kb,lb){var mb=lb.profile_id+'',nb=lb.level+'';ab(mb,nb);var ob;for(ob in u)if(u[ob]===mb){var pb=r(ob);pb&&cb(pb,mb,nb,false);}});g.subscribe('listeditor/close_editor',function(){var kb;for(kb in u){var lb=r(kb);lb&&eb(lb,false);}});function gb(kb,lb,mb){x[lb]=mb;var nb=z[lb]&&!la,ob=j.scry(kb,'li.SubscribeMenuNotifyMeCheckbox');if(ob.length!==0){var pb=ob[0];i.conditionShow(pb,!nb);var qb=j.scry(kb,'li.SubscribeMenuNotifyMeCheckboxSeparator');if(qb.length>0)i.conditionShow(qb[0],!nb);if(mb){xa(pb);}else ya(pb);}}function hb(kb,lb){var mb={profile_id:lb};g.inform('EnableNotifsForUser',mb);new h().setURI(ha).setMethod('POST').setData({notifier_id:lb,enable:true}).setErrorHandler(g.inform.bind(null,'EnableNotifsForUserFail',mb)).send();}function ib(kb,lb){var mb={profile_id:lb};g.inform('DisableNotifsForUser',mb);new h().setURI(ha).setMethod('POST').setData({notifier_id:lb,enable:false}).setErrorHandler(g.inform.bind(null,'DisableNotifsForUserFail',mb)).send();}var jb={init:function(kb,lb,mb){var nb=j.getID(kb);ma[nb]=mb;if(!u[nb])k.listen(kb,'click',function(ob){return oa(kb,u[nb],mb,ob.getTarget());});if(mb===s&&ia[lb].length)fb(kb,lb,ia[lb]);if(ba[lb])ua(kb,lb);u[nb]=lb;i.conditionClass(kb,'NonFriendSubscriptionMenu',!v[lb]);i.conditionClass(kb,'cannotSubscribe',!y[lb]);i.conditionClass(kb,'noSubscriptionLevels',z[lb]&&!aa[lb]);i.conditionClass(kb,'noSubscribeCheckbox',!v[lb]&&!z[lb]);db(kb,lb,w[lb]);gb(kb,lb,x[lb]);g.subscribe(['FollowUser','FollowingUser','UnfollowUserFail'],function(ob,pb){if(pb.profile_id==lb)db(kb,lb,true);}.bind(this));g.subscribe(['UnfollowUser','UnfollowingUser','FollowUserFail'],function(ob,pb){if(pb.profile_id==lb){g.inform('SubMenu/Reset');db(kb,lb,false);}}.bind(this));g.subscribe(['EnableNotifsForUser','DisableNotifsForUserFail'],function(ob,pb){if(pb.profile_id==lb)gb(kb,lb,true);}.bind(this));g.subscribe(['DisableNotifsForUser','EnableNotifsForUserFail'],function(ob,pb){if(pb.profile_id==lb)gb(kb,lb,false);}.bind(this));g.subscribe('listeditor/friend_lists_changed',function(ob,pb){if(pb.notify_state){var qb=pb.added_uid?pb.added_uid:pb.removed_uid;gb(kb,qb,pb.notify_state.is_notified);}}.bind(this));},getSubscriptions:function(kb){return {level:ba[kb],custom_categories:ca[kb]};},setSubscriptions:function(kb,lb,mb,nb,ob,pb,qb,rb,sb,tb,ub,vb,wb){ab(kb,qb+'');v[kb]=lb;w[kb]=mb;y[kb]=nb;z[kb]=ob;aa[kb]=pb;da[kb]=sb+'';ca[kb]=rb.map(String);ea[kb]=tb.map(String);ia[kb]=wb;x[kb]=ub;la=vb;}};e.exports=a.EditSubscriptions||jb;},null);
__d("legacy:EditSubscriptions",["SubscriptionLevels","EditSubscriptions"],function(a,b,c,d){a.SubscriptionLevels=b('SubscriptionLevels');a.EditSubscriptions=b('EditSubscriptions');},3);
__d("DynamicFriendListEducation",["Event","Arbiter","AsyncRequest","Dialog","PageTransitions","arrayContains","createArrayFrom","removeFromArray"],function(a,b,c,d,e,f,g,h,i,j,k,l,m,n){var o,p,q,r,s,t;function u(){q&&q.hide();r&&r.hide();}function v(y){n(p,y);u();s({accept_tag_education:true});}function w(){u();s({nux_cancel:true});}var x={init:function(y,z){o=y;p=m(z).map(String);k.registerHandler(function(){u();o=false;s=undefined;p=[];});},showDialog:function(y,z,aa){if(o&&l(p,y)){u();h.inform('DynamicFriendListEducation/dialogOpen',{uid:z,flid:y});s=aa;q=new j().setAsync(new i('/ajax/friends/lists/smart_list_education.php').setMethod('GET').setData({flid:y,uid:z}).setReadOnly(true)).setHandler(v.bind(this,y)).setCloseHandler(function(){h.inform('DynamicFriendListEducation/dialogClosed',{uid:z,flid:y});}).setCancelHandler(function(){h.inform('DynamicFriendListEducation/dialogCancel',{uid:z,flid:y});}).show();}else aa();},showContextualDialog:function(y,z,aa,ba){if(o&&l(p,y)){u();t=aa;s=ba;new i('/ajax/friends/lists/smart_list_contextual_education.php').setMethod('GET').setData({flid:y,uid:z}).setReadOnly(true).send();}else ba();},setContextualDialog:function(y,z,aa,ba){r=y;r.setContext(t);r.show();g.listen(z,'click',v.bind(this,ba));g.listen(aa,'click',w);}};e.exports=x;},null);
__d("FriendStatus",["Arbiter","AsyncRequest","SubscribeButton","arrayContains","copyProperties","createArrayFrom","eachKeyVal"],function(a,b,c,d,e,f,g,h,i,j,k,l,m){function n(r,s,t){this.id=r;this.update(s,t);}k(n.prototype,{update:function(r,s){r&&(this.status=r);if(s){this.lists=l(s).map(String);this._informListChange();}},isComplete:function(){return !!this.lists;},addToList:function(r){if(this.lists&&!j(this.lists,r))this.lists.push(r);this._informListChange();},removeFromList:function(r){if(this.lists){var s=this.lists.indexOf(r);s!==-1&&this.lists.splice(s,1);}this._informListChange();},updateList:function(r,s){s?this.addToList(r):this.removeFromList(r);},_informListChange:function(){g.inform('FriendListMembershipChange',{uid:this.id,lists:this.lists});}});k(n,{ARE_FRIENDS:1,INCOMING_REQUEST:2,OUTGOING_REQUEST:3,CAN_REQUEST:4});var o={},p={};function q(r,s,t){if(!o[t.uid]){o[t.uid]=new n(t.uid,r);}else o[t.uid].update(r);g.inform('FriendRequest/change',{uid:t.uid,status:r});}g.subscribe(['FriendRequest/cancel','FriendRequest/unfriend'],function(r,s){s.profile_id=s.uid;s.connected=false;g.inform(i.UNSUBSCRIBED,s);});g.subscribe(['FriendRequest/cancel','FriendRequest/unfriend','FriendRequest/sendFail'],q.bind(null,n.CAN_REQUEST));g.subscribe(['FriendRequest/confirmFail'],q.bind(null,n.INCOMING_REQUEST));g.subscribe(['FriendRequest/cancelFail','FriendRequest/sent','FriendRequest/sending'],q.bind(null,n.OUTGOING_REQUEST));g.subscribe(['FriendRequest/confirm','FriendRequest/confirming'],q.bind(null,n.ARE_FRIENDS));k(n,{CLOSE_FRIENDS:null,ACQUAINTANCES:null,getFriend:function(r,s){if(o[r]&&o[r].isComplete()){s(o[r]);}else if(p[r]){p[r].push(s);}else{p[r]=[s];new h().setURI("/ajax/friends/status.php").setData({friend:r}).setHandler(function(t){var u=t.getPayload();setTimeout(n.initFriend.bind(n,r,u.status,u.lists),0);}).send();}},initFriend:function(r,s,t){var u=o[r]||new n(r);u.update(u.status||s,u.lists||t);o[r]=u;p[r]&&p[r].forEach(function(v){v(u);});p[r]=null;},setSpecialLists:function(r){var s=n.CLOSE_FRIENDS===null;n.CLOSE_FRIENDS=r.close+'';n.ACQUAINTANCES=r.acq+'';if(s)m(o,function(t,u){u._informListChange();});}});e.exports=n;},null);
__d("FriendEditLists",["Arbiter","AsyncRequest","CSS","DOMQuery","DynamicFriendListEducation","EditSubscriptions","Event","FriendStatus","MenuDeprecated","Parent","ScrollableArea","SubscribeButton","URI","$","arrayContains","copyProperties","ge"],function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w){var x=5,y={},z='/ajax/profile/removefriendconfirm.php',aa='/ajax/friends/requests/cancel.php',ba='/ajax/choose/',ca='/profile.php',da,ea,fa,ga=null,ha={profile_browser:43,fbx_top_bar:1,hovercard:5};function ia(ta,ua,va){var wa=y[ta.id],xa=function(ya){var za={action:va?'add_list':'del_list',to_friend:wa.id,friendlists:[ua],source:da};if(ya)v(za,ya);wa.updateList(ua,va);var ab;if(va&&ua==n.CLOSE_FRIENDS){ab=la(ta,n.ACQUAINTANCES);if(o.isItemChecked(ab)){o.toggleItem(ab);ia(ta,n.ACQUAINTANCES,false);}}else if(va&&ua==n.ACQUAINTANCES){ab=la(ta,n.CLOSE_FRIENDS);if(o.isItemChecked(ab)){o.toggleItem(ab);ia(ta,n.CLOSE_FRIENDS,false);}}var bb={flid:ua,uid:wa.id},cb=va?'FriendListHovercard/add':'FriendListHovercard/remove';g.inform(cb,bb);new h().setURI('/ajax/add_friend/action.php').setData(za).send();};if(va){k.showDialog(ua,wa.id,xa);}else xa();}function ja(ta){var ua=j.scry(ta,'input')[0];return ua&&ua.value;}function ka(ta,ua,va){if(i.hasClass(va,'async_saving'))return;var wa={uid:ua.id};new h().setURI(aa).setMethod('POST').setData({friend:ua.id,cancel_ref:fa}).setHandler(g.inform.bind(g,'FriendRequest/cancel',wa)).setErrorHandler(g.inform.bind(g,'FriendRequest/cancelFail',wa)).setStatusElement(va).send();}function la(ta,ua){var va=o.getItems(ta);for(var wa=0;wa<va.length;wa++)if(ja(va[wa])==ua)return va[wa];return null;}function ma(ta,ua){var va=o.getItems(ta);va.forEach(function(wa){var xa=ja(wa),ya=u(ua.lists,xa);if(o.isItemChecked(wa)!==ya)o.toggleItem(wa);});}function na(ta){var ua=o.getItems(ta),va=!i.hasClass(ta,'followButtonFlyout')&&!i.hasClass(ta,'likeButtonFlyout'),wa=[],xa=[],ya=0,za=0;ua.forEach(function(eb){if(i.hasClass(eb,'neverHide')){i.removeClass(eb,'underShowMore');ya++;}else if(o.isItemChecked(eb)){wa.push(eb);}else if(i.hasClass(eb,'neverShow')||i.hasClass(eb,'FriendListCreateTrigger')||(!va&&i.hasClass(eb,'friendOptionsOnly'))){i.addClass(eb,'underShowMore');za++;}else xa.push(eb);});var ab=x-ya,bb=wa.concat(xa),cb=za;bb.forEach(function(eb){if(i.hasClass(eb,'ShowMoreItem')){ab--;return;}if(ab){i.removeClass(eb,'underShowMore');ab--;}else{i.addClass(eb,'underShowMore');cb=true;}});i.conditionClass(ta,'hasMoreFriendListItems',cb);var db=j.scry(ta,'.FriendListMenuShowMore');db.forEach(function(eb){i.removeClass(eb,'FriendListMenuShowMore');});}function oa(ta,ua){i.conditionClass(ta,'FriendListMemorializedUser',ua);}function pa(ta,ua){i.conditionClass(ta,'FriendListCannotSuggestFriends',!ua);}function qa(ta,ua){var va=j.scry(ta,'.FriendListUnfriend')[0],wa=j.scry(ta,'.FriendListCancel')[0],xa=j.scry(ta,'.FriendListSuggestFriends')[0],ya=j.scry(ta,'.FriendListFriendship')[0];if(wa)i.conditionShow(wa,ua.status==n.OUTGOING_REQUEST);if(va){i.conditionShow(va,ua.status==n.ARE_FRIENDS);var za=j.find(va,'a');za.setAttribute('ajaxify',s(z).addQueryData({uid:ua.id,unref:ea}).toString());if(!ga)ga=m.listen(za,'click',function(ab){var bb=p.byClass(ab.getTarget(),'FriendListUnfriend');if(!bb)return;var cb=s(j.find(bb,'a').getAttribute('ajaxify')).getQueryData();});}else i.conditionClass(ta,'NoFriendListActionSeparator',!wa||ua.status!=n.OUTGOING_REQUEST);if(xa)j.find(xa,'a').setAttribute('href',s(ba).addQueryData({type:'suggest_friends',newcomer:ua.id,ref:'profile_others_dropdown'}).toString());if(ya){i.conditionShow(ya,ua.status==n.ARE_FRIENDS);j.find(ya,'a').setAttribute('href',s(ca).addQueryData({and:ua.id}).toString());}}function ra(ta,ua,va){var wa=j.scry(ta,'div.FriendListSubscriptionsMenu');if(wa.length!==0)l.init(ta,ua,va);}g.subscribe('FriendRequest/change',function(ta,ua){for(var va in y){var wa=w(va),xa=y[va];if(wa&&xa&&xa.id==ua.uid){ma(wa,xa);qa(wa,xa);na(wa);}}});o.subscribe('select',function(ta,ua){if(i.hasClass(ua.item,'ShowMoreItem')&&i.hasClass(ua.menu,'FriendListMenu')){i.addClass(ua.menu,'FriendListMenuShowMore');q.poke(ua.item);}});var sa={init:function(ta,ua,va,wa,xa,ya,za){ta=t(ta);da=va;ea=ya;fa=za;var ab=ha[va]||45;if(!y[ta.id])o.subscribe('select',function(bb,cb){if(j.contains(ta,cb.item))if(p.byClass(cb.item,'FriendListItem')){o.toggleItem(cb.item);var db=ja(cb.item);ia(ta,db,o.isItemChecked(cb.item));}else if(p.byClass(cb.item,'FriendListCancel')){ka(ta,y[ta.id],cb.item);}else if(p.byClass(cb.item,'FriendListUnfriend'))g.inform('FriendEditLists/unfriend');});i.addClass(ta,'async_saving');n.getFriend(ua,function(bb){oa(ta,wa);pa(ta,xa);ma(ta,bb);qa(ta,bb);y[ta.id]=bb;na(ta);ra(ta,ua,ab);i.removeClass(ta,'async_saving');}.bind(this));}};e.exports=a.FriendEditLists||sa;},null);
__d("FriendListFlyoutController",["Event","Arbiter","AsyncRequest","Button","ContextualLayer","CSS","DataStore","Dialog","DOM","DOMQuery","FriendEditLists","FriendStatus","Keys","Layer","LayerHideOnEscape","LayerTabIsolation","MenuDeprecated","Parent","ScrollableArea","Style","TabbableElements","UserAgent","cx","emptyFunction"],function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,aa,ba,ca,da){var ea,fa,ga,ha=null,ia=null,ja,ka,la,ma,na,oa,pa=1500,qa,ra=false,sa=['uiButtonConfirm','uiButtonSpecial',"_42gz","_42g-","_4jy2","_51tl","_4jy1"],ta={init:function(wb,xb){ta.init=da;ea=wb;ea.subscribe('mouseenter',cb);ea.subscribe('mouseleave',function(){if(!ra)rb();});ea.subscribe('hide',eb);ea.enableBehavior(v);ea.enableBehavior(u);qa=xb;if(ha)o.setContent(ea.getContent(),[ha,ia]);var yb=function(ac){var bc=x.byClass(ac.getTarget(),'enableFriendListFlyout');if(bc){ra=true;if(ja!==bc){ga&&tb();qb(bc);}}else if(ra)tb();},zb=function(ac){var bc=x.byClass(ac.getTarget(),'enableFriendListFlyout');if(bc)if(ja===bc){clearTimeout(ma);}else{ga&&tb();qb(bc);}};g.listen(document.documentElement,{click:yb,mouseover:zb,keydown:function(event){var ac=event.getTarget();if(event.getModifiers().any)return;if(!ga||p.isNodeOfType(ac,['input','textarea']))return;var bc=g.getKeyCode(event),cc;switch(bc){case s.UP:case s.DOWN:var dc=bb();cc=za(dc);xa(dc[cc+(bc===s.UP?-1:1)]);return false;case s.SPACE:var ec=ya(ac);if(ec){ua(ec);event.prevent();}break;default:var fc=String.fromCharCode(bc).toLowerCase(),gc=bb();cc=za(gc);var hc=cc,ic=gc.length;while((~cc&&(hc=++hc%ic)!==cc)||(!~cc&&++hc<ic)){var jc=w.getItemLabel(gc[hc]);if(jc&&jc.charAt(0).toLowerCase()===fc){xa(gc[hc]);return false;}}}}});h.subscribe('FriendEditLists/unfriend',tb);h.subscribe('FriendRequest/cancel',tb);h.subscribe('DynamicFriendListEducation/dialogOpen',function(){oa=true;});h.subscribe('DynamicFriendListEducation/dialogClosed',function(){oa=false;rb();});},initContent:function(wb){o.appendContent(document.body,wb);fb(wb);setTimeout(function(){if(!ha){ha=wb;ea&&o.setContent(ea.getContent(),[ha,ia]);l.show(ha);g.listen(ha,'click',ub);ga&&nb(ja);}else{o.remove(wb);wb=null;}},0);},initNux:function(wb){if(ia)return;ia=wb;ea&&o.setContent(ea.getContent(),[ha,ia]);},show:function(wb){ob(wb);},hide:function(wb){wb===false?tb():rb();},setActiveNode:function(wb){ga&&tb();ja=wb;ka=g.listen(wb,'mouseleave',function(){ja=null;ka&&ka.remove();});},setCloseListener:function(wb,xb){m.set(wb,'flfcloselistener',xb);if(ja!=wb)m.set(wb,'flfcloselistenertimeout',setTimeout(vb.bind(null,wb),pa));},setCloseListenerTimeout:function(wb){pa=wb;}};function ua(wb){ba.firefox()&&wa(wb).blur();w.inform('select',{menu:va(wb),item:wb});}function va(wb){if(l.hasClass(wb,'uiMenuContainer'))return wb;return x.byClass(wb,'uiMenu');}function wa(wb){return p.find(wb,'a.itemAnchor');}function xa(wb){if(wb&&ab(wb)){w._removeSelected(ea.getContent());l.addClass(wb,'selected');wa(wb).focus();}}function ya(wb){return x.byClass(wb,'uiMenuItem');}function za(wb){if(document.activeElement){var xb=ya(document.activeElement);return wb.indexOf(xb);}return -1;}function ab(wb){return !l.hasClass(wb,'disabled')&&z.get(wb,'display')!=='none'&&z.get(x.byClass(wb,'uiMenu'),'display')!=='none';}function bb(){return w.getItems(ea.getContent()).filter(ab);}function cb(){clearTimeout(ma);}function db(wb){for(var xb=0;xb<sa.length;xb++)if(l.hasClass(wb,sa[xb]))return false;return true;}function eb(){if(ja){if(db(ja)){l.removeClass(ja,"_52nd");if(l.hasClass(ja,'uiButton')||l.hasClass(ja,"_42fu"))l.removeClass(ja,'selected');}if(m.get(ja,'flfcloselistener')){var wb=ja;m.set(ja,'flfcloselistenertimeout',setTimeout(vb.bind(null,wb),pa));}}ga=false;mb();ja=null;}function fb(wb){var xb=p.scry(wb,'[tabindex="0"]');xb.forEach(function(yb){yb.tabIndex='-1';});xb[0]&&(xb[0].tabIndex='0');}function gb(wb){if(p.isNodeOfType(wb,'label')&&l.hasClass(wb,'uiButton'))wb=j.getInputElement(wb);return wb;}function hb(wb){return m.get(gb(wb),'profileid');}function ib(wb){return m.get(gb(wb),'memorialized')==='true';}function jb(wb){return m.get(gb(wb),'cansuggestfriends')==='true';}function kb(wb){return m.get(gb(wb),'unref');}function lb(wb){return m.get(gb(wb),'cancelref');}function mb(){ka&&ka.remove();ka=null;na&&t.unsubscribe(na);na=null;ma&&clearTimeout(ma);ma=null;}function nb(wb){var xb=hb(wb),yb=ib(wb),zb=jb(wb),ac=m.get(wb,'flloc'),bc=kb(wb),cc=lb(wb);q.init(ha,xb,ac,yb,zb,bc,cc);l.conditionClass(ha,'followButtonFlyout',l.hasClass(wb,'profileFollowButton'));l.conditionClass(ha,'friendButtonFlyout',l.hasClass(wb,'FriendRequestFriends')||l.hasClass(wb,'FriendRequestIncoming')||l.hasClass(wb,'FriendRequestOutgoing'));l.conditionClass(ha,'likeButtonFlyout',l.hasClass(wb,'profileLikeButton'));var dc=p.scry(ha,'div.uiScrollableArea')[0];dc&&y.poke(dc);var ec=aa.find(ha)[0];ec&&ec.focus();}function ob(wb){if(!ea||ga)return;ea.setContext(wb);ea.setCausalElement(wb);wb.setAttribute('aria-expanded','true');if(db(wb)){l.addClass(wb,"_52nd");if(l.hasClass(wb,'uiButton')||l.hasClass(wb,"_42fu"))l.addClass(wb,'selected');}ea.show();ja=wb;ga=true;var xb=null;if(ha){xb='show';nb(wb);}else{xb='init_show';new i().setURI('/ajax/friends/lists/flyout_content.php').setStatusElement(ea.getContent()).send();}mb();ka=g.listen(wb,'mouseleave',rb);na=t.subscribe('show',pb);if(m.get(wb,'flfcloselistener'))clearTimeout(m.remove(wb,'flfcloselistenertimeout'));var yb=hb(wb);r.getFriend(yb,function(zb){if(zb.status==r.ARE_FRIENDS)new i().setURI('/ajax/friends/lists/flyout_log.php').setData({target_id:hb(wb),unref:kb(wb),action:xb}).send();if(!ia)return;if(zb.status==r.OUTGOING_REQUEST){l.show(ia);i.bootstrap('/ajax/friends/lists/nux_flyout.php',null,true);}else l.hide(ia);});if(!fa||wb.id!==fa.id){h.inform('listeditor/close_editor');h.inform('friend-list/close_editor');}fa=wb;}function pb(wb,xb){if(!(xb instanceof k)||!p.contains(ja,xb.getContext()))rb();}function qb(wb){ja=wb;la=setTimeout(ob.bind(null,wb),qa);ka=g.listen(wb,'mouseleave',function(){clearTimeout(la);ja=null;ka&&ka.remove();});}function rb(){ma=setTimeout(tb,150);}function sb(){var wb=n.getCurrent(),xb=wb&&wb.getBody();return !!(xb&&p.scry(xb,'.friendListDialogTourCarousel')[0]);}function tb(){if(oa||sb())return;ra=false;if(ea){ea.hide();var wb=ea.getCausalElement();wb&&wb.setAttribute('aria-expanded','false');}}function ub(event){var wb=x.byTag(event.getTarget(),'a');if(wb&&l.hasClass(wb,'FriendListActionItem'))rb();}function vb(wb){var xb=m.remove(wb,'flfcloselistener');xb&&xb();}e.exports=a.FriendListFlyoutController||ta;},null);
__d("AddFriendButton",["Event","Animation","Arbiter","AsyncRequest","AsyncResponse","collectDataAttributes","CSS","DOMQuery","FriendListFlyoutController","FriendStatus","ge","goURI","Style","SubscribeButton","URI","XPubcontentChainedSuggestionsControllerURIBuilder"],function(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v){var w={ERROR_ALREADY_ADDED:1431005,init:function(x,y,z,aa,ba,ca,da,ea,fa,ga,ha,ia){var ja=x.id,ka=null,la=n.scry(x,'.addButton')[0],ma=n.scry(x,'.addFriendText')[0],na=n.scry(x,'.outgoingButton')[0],oa=n.scry(x,'.incomingButton')[0],pa=n.scry(x,'.friendButton')[0];function qa(wa,xa,ya){var za=new u(la.getAttribute('ajaxify')),ab=l(x,['ft','gt']);new j().setURI(ca).setData({to_friend:y,action:wa,how_found:aa,ref_param:ba,link_data:ab,outgoing_id:na.id,xids:za.getQueryData().xids,logging_location:da,no_flyout_on_click:ea,ego_log_data:fa,http_referer:ha}).setErrorHandler(xa).setServerDialogCancelHandler(ya).setRelativeTo(na).send();if(ia&&wa==='add_friend'){var bb=(new v()).setInt('friendid',y).getURI();new j().setURI(bb).send();}i.inform(t.SUBSCRIBED,{profile_id:y.toString(),conntected:true});}function ra(wa,xa){if(ma){m.hide(ma);}else if(la)m.hide(la);na&&m.hide(na);oa&&m.hide(oa);pa&&m.hide(pa);if(wa)m.show(wa);if('Outgoing'==xa&&ka!=xa&&ga)new h(wa).from('backgroundColor','#FFF8CC').to('backgroundColor','transparent').from('borderColor','#FFE222').to('borderColor',s.get(wa,'borderLeftColor')).duration(2000).go();ka&&m.removeClass(x,'fStatus'+ka);ka=xa;m.addClass(x,'fStatus'+xa);}function sa(wa){if(m.hasClass(wa,'enableFriendListFlyout')){o.show(wa);}else o.hide();}var ta=i.subscribe('FriendRequest/change',function(wa,xa){va();if(xa.uid!=y)return;switch(xa.status){case p.ARE_FRIENDS:return ra(pa,'Friends');case p.INCOMING_REQUEST:return ra(oa,'Incoming');case p.OUTGOING_REQUEST:return ra(na,'Outgoing');case p.CAN_REQUEST:return ra(ma?ma:la,'Requestable');}}),ua;if(z)ua=i.subscribe('FriendRequest/confirm',function(wa,xa){va();xa.uid==y&&r(z);});la&&g.listen(la,'click',function(){i.inform('FriendRequest/sending',{uid:y});if(ea){o.setActiveNode(na);}else sa(na);qa("add_friend",function(wa){var xa=wa.error==w.ERROR_ALREADY_ADDED?'FriendRequest/sent':'FriendRequest/sendFail';i.inform(xa,{uid:y});o.hide();k.defaultErrorHandler(wa);},function(wa){i.inform('FriendRequest/sendFail',{uid:y});o.hide();});});function va(){if(q(ja))return;ta&&ta.unsubscribe();ua&&ua.unsubscribe();ta=ua=null;}}};e.exports=w;},null);
__d("FriendButtonIcon",["Arbiter","FriendStatus","Button","arrayContains"],function(a,b,c,d,e,f,g,h,i,j){e.exports={register:function(k,l,m){g.subscribe('FriendListMembershipChange',function(n,o){if(o.uid==m){var p=j(o.lists,h.CLOSE_FRIENDS),q=j(o.lists,h.ACQUAINTANCES);if(p&&!q){i.setIcon(k,l.close);}else if(q&&!p){i.setIcon(k,l.acquaintance);}else i.setIcon(k,l.friend);}});}};},null);