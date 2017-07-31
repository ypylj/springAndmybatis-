<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta content="default" name="decorator">
	<title>登录页面</title>
	<%-- <link rel="stylesheet" href="${ctxStatic}/login/style/css/reset.css"/>
	<link rel="stylesheet" href="${ctxStatic}/login/style/css/global.css"/>
	<link rel="stylesheet" href="${ctxStatic}/login/style/css/component.css"/>
	<link rel="stylesheet" href="${ctxStatic}/login/style/css/login.css"/>
	<script src="${ctxStatic}/login/style/js/jquery-1.8.2.min.js"></script>
	<script src="${ctxStatic}/login/style/js/jquery.cookie.js"></script>
	<script src="${ctxStatic}/login/style/js/jquery.validate.js"></script>
	<script src="${ctxStatic}/login/style/js/jquery.metadata.js"></script>
	<script src="${ctxStatic}/login/style/js/jquery.validate.message_cn.js"></script>
	<script src="${ctxStatic}/login/style/js/jquery.nicescroll.min.js"></script>
	<script src="${ctxStatic}/login/style/js/mgTextWidth.js"></script>
	<script src="${ctxStatic}/login/style/js/tinybox.js"></script>
    <script src="${ctxStatic}/login/style/js/global.js"></script>
	<script src="${ctxStatic}/login/style/js/components.js"></script>
	<script src="${ctxStatic}/login/style/js/md5.js"></script>
 	<script src="${ctxStatic}/login/style/js/login.js"></script> --%>
 	<script>
	
  	$(document).ready(function(){
		if ($.browser.msie && ( ($.browser.version == "6.0") || ($.browser.version == "7.0") ) && !$.support.style) {
			$('.IE_alert').show();
		}else{
			//fadeIn() 方法使用淡入效果来显示被选元素，假如该元素是隐藏的.如果元素已经显示，则该效果不产生任何变化。
			$('.login_form').fadeIn();
			registValidate();//注册验证
		}
	});

	var destPage = null;
	
	var pageType = null;
/*
 * 刷新验证码
 */
	function myReload() {  
	    document.getElementById("CreateCheckCode").src = document  
	            .getElementById("CreateCheckCode").src  
	            + "?nocache=" + new Date().getTime();  
	}
/*
 * 验证码校验
 */
 function validate(obj)	{
	  var randCheckCode="<%=session.getAttribute("randCheckCode")%>";
		console.log("randCheckCode"+randCheckCode);
		console.log("randCheckCodeSession"+obj.value);
		if(randCheckCode ==null){
			 $("#identifyCode").append(" <b>验证码不能为空</b>");//append('<h1>验证码不能为空</h1>')
		}else if(randCheckCode!=obj.value){
			$("#identifyCode").append('<b>验证码输入错误，请重新输入</b>')
		}
}
</script>
</head>

<body scroll="no">

<div id="login_wrapper">
	<div id="login_main">
		<!-- <div class="login_logo1"></div> -->
<!-- 		<div class="IE_alert">
			<p>很遗憾，您的浏览器过于古老,请使用更新版本的浏览器</p>
			<p class="suggestBrowser">我们建议您使用 <a href="http://www.google.cn/intl/zh-CN/chrome/browser/?installdataindex=chinabookmarkcontrol&brand=CHUN">谷歌浏览器</a>，或 <a href="http://windows.microsoft.com/zh-CN/internet-explorer/download-ie">更高版本的IE浏览器</a> </p>
		</div>
 -->
		<div class="login_form">
			<div class="login_form_header">
			<!-- 	<p class="p_login login_active">登录</p> -->
<!-- 				<p class="p_register"><span class="img_register"></span>注册</p>
				<div class="clearB"></div>
 -->			</div>
			<form:form class="login_items" id="login_items" action="${ctx}/sys/login">
				<div><label class="input_val">用户名：</label><input class="input" name="loginName"  autocomplete="off" /><%-- <img src="${ctxStatic}/login/style/images/login_mail.png" />  --%>
				</div>
				<div>
				<label class="input_val">密&nbsp;&nbsp;&nbsp;码：</label><input class="input" name="password" type="password" id="login_password" autocomplete="off" /><%-- <img src="${ctxStatic}/login/style/images/login_password.png" />  --%>
				</div>
				<div><label class="input_val">验证码: </label><input id="identifyCode" class="input" name="identifyCode" type="text" placeholder="验证码区分大小写" onchange="validate(this);"/>
				<div >
				<!-- 产生验证码部分 --><!-- 
				 <input name="checkCode" type="text" id="checkCode" title="验证码区分大小写"  
                size="8" ,maxlength="4" />  --> 
            	<img src="PictureCheckCode" id="CreateCheckCode" align="middle">  
            	<a href="" onclick="myReload()"> 看不清,换一个</a>  
        <!--     <input type="submit" value="提交" />  
		 -->		</div>	
				<!-- </div><div class="login_msg">
					<p class="login_error">
						<span></span>
					</p>
				</div>
 -->
				<div class="clearB"></div>
				<div class="remeber">
					<span class="input_checkbox">
						<input type="checkbox" name="REMEMBER" id="remember" checked="checked"/>
						<label for="remember">下次自动登录</label>
					</span>
					&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="forgetPassword" href="javascript:void(0)">忘记密码</a>
				</div>
				<!-- <a class="login_btn submit">登&nbsp;&nbsp;&nbsp;&nbsp;录</a> -->
				 <input type="submit" value="登录" />  
			</form:form>
			<%-- 
			<form:form class="register_items" id="register_items">
				<label class="input_val"><input class="input" name="company" value="" autocomplete="off" /><span>组织名</span></label>
				<label class="input_val"><input class="input" name="loginNme" value="" autocomplete="off" /><span>用户名</span></label>
				<label class="input_val"><input class="input" name="phone" value="" autocomplete="off" /><span>手机号</span></label>
				<label class="input_val"><input class="input" name="email" value="" autocomplete="off" /><span>登录邮箱</span></label>
				<label class="input_val"><input class="input" name="password" value="" type="password" autocomplete="off" /><span>密码</span></label>
				<!-- <div class="remeber">
					点击注册表示您接受
					<a id="treaty">《JquerySchoolCRM免费版用户协议》</a>
				</div>
				 --><div class="register_msg">
					<p class="register_error">
						<span></span>
					</p>
				</div>
				<a class="login_btn submit">免&nbsp;&nbsp;费&nbsp;&nbsp;注&nbsp;&nbsp;册</a>
			</form:form> --%><!-- 
			<div class="login_coopeField">
				<p class="coopeLogin_title" type="OPEN">使用其他账号登录</p>
				<div class="coopeLogin_mainFiild">
					<a class="btn_coopeLogin coopeLogin_weixin" href="#"><span class="span_coopeLogin">微信二维码登录</span></a>
					<a class="btn_coopeLogin coopeLogin_mingdao" href="#"><span class="span_coopeLogin">用QQ账户登录</span></a>
					<a class="btn_coopeLogin coopeLogin_weibo" href="#"><span class="span_coopeLogin">用微博账号登录</span></a>
				</div>
			</div> -->
		</div>

		<p class="contactUs">联系我们：1719341849@qq.com</p>
	</div>
</div>

<!-- 忘记密码 -->
<!-- <div class="popwin_forgetPassword" style="display:none">
	<p class="popwin_title">
		忘记密码
	</p>
	<div class="popwin_content">
		<p class="popwin_error">这个邮箱好像没有注册过哦</p>
		<p class="popwin_tips">请输入注册时的邮箱账号</p>
		<input class="input popwin_input popwin_newForm_input" type="text" name="SIGNUPEMAIL" value="" autocomplete="off" />
		<a class="button btn_blue popwin_forgetPassword_confirm">确定</a>
		<a class="button btn_gray popwin_cancel" onclick="TINY.box.hide();">取消</a>
	</div>
</div>
 -->
<!-- 服务协议弹出窗 -->
<!-- <div class="popwin" id="popwin_treaty" style="display:none">
	<p class="popwin_title">
		JquerySchoolCRM免费版用户协议
	</p>
	<div class="popwin_content treaty">
		<p class="treaty_content">
			&nbsp;&nbsp;&nbsp;&nbsp;JquerySchoolCRM免费版（以下简称免费版）是由北京易多客信息技术有限公司（以下简称JquerySchool）在该公司MikeCRM网站上创建的营销化客户管理平台。若您申请JquerySchoolCRM免费版帐户（以下简称免费版帐户）并使用相应服务，您必须首先同意此协议。<br />
			<span class="treaty_content_h2">一、接受</span><br />
			（1）如果您获得并使用我们所提供的产品和服务，则应视为您已经详细阅读了本协议的内容，同意本协议的内容，并同意遵守本协议的规定；<br />
			（2）基于对我们本身、用户及市场状况不断变化的考虑，我们保留随时修改、新增、删除本协议条款的权利，修改、新增、删除本协议条款时，我们将公告修改、新增、删除的事实，而不另行对您进行个别通知。若您不同意我们所修改、新增、删除的内容，可停止使用我们所提供的服务。若您继续使用我们提供的服务，则视同您同意并接受本协议条款修改、新增、删除后之一切内容，且不得因此而要求任何补偿或赔偿；<br />
			（3）除非特别声明，某些增强服务的新功能将适用此协议；<br />
			（4）此协议只有JquerySchool免费版的书面授权人员才可以修改。<br />
			<span class="treaty_content_h2">二、服务内容</span><br />
			（1）此协议所述服务仅在JquerySchoolMikeCRM网站中文网站内有效。JquerySchool中文网站是指http://www.mikecrm.com及其所属网页；<br />
			（2） JquerySchoolCRM免费版不会向客户收取任何费用，JquerySchool无义务提供相关附加服务；<br />
			（3） JquerySchoolCRM免费版有权根据实际情况自主调整服务内容。<br />
			<span class="treaty_content_h2">三、用户</span><br />
			（1）JquerySchoolCRM网站的用户是能够承担相应法律责任的实体或自然人。若您不具备此资格，请不要使用JquerySchoolCRM网站提供的服务；<br />
			（2）JquerySchoolCRM网站要求用户在使用服务时必须遵守相关法律法规。JquerySchool对用户使用服务所产生的与其他公司或者个人的纠纷不负法律责任；<br />
			（3） JquerySchoolCRM网站有权对恶意用户终止服务，并无需特别通知；<br />
			（4）  JquerySchoolCRM网站的服务将不提供给那些被临时或永久取消会员资格的实体或自然人。<br />
			<span class="treaty_content_h2">四、费用</span><br />
			（1）JquerySchoolCRM网站免费版所有账户均为长期免费，并免费享有500M的文件存储空间。 <br />
			（2）JquerySchool保留对收费模式和具体金额调整的权利，涉及收费服务，将至少提前30天的时间通过电子邮件的形式通知用户。<br />
			<span class="treaty_content_h2">五、服务期限</span><br />
			&nbsp;&nbsp;&nbsp;&nbsp;JquerySchoolCRM网站有权判定免费版用户的行为是否符合《JquerySchoolCRM免费版用户协议》的要求，如果免费版用户违背了该《JquerySchoolCRM免费版用户协议》的规定，JquerySchoolCRM网站有权决定取消该JquerySchoolCRM免费版用户资格或者采取其他JquerySchoolCRM网站认为合适的措施。<br />
			<span class="treaty_content_h2">六、服务终止</span><br />
			&nbsp;&nbsp;&nbsp;&nbsp;用户有下列情形之一的，JquerySchoolCRM网站有权随时暂停、终止、取消或拒绝用户服务。<br />
			（1）用户违反了此协议或已在约定范围内的任一条款；<br />
			（2）利用JquerySchoolCRM网站的发布功能滥发重复信息；<br />
			（3）未经请求或授权向JquerySchoolCRM网站用户发送大量与业务不相关的信息；<br />
			（4）冒用其他实体或自然人的名称发布商业信息或进行商业活动；<br />
			（5）攻击JquerySchoolCRM网站的数据、网络或服务；<br />
			（6）盗用他人在JquerySchoolCRM网站上的帐户名和 / 或密码。<br />
			&nbsp;&nbsp;&nbsp;&nbsp;JquerySchool严格禁止用户的以下行为，经发现后JquerySchool将一律终止用户服务：<br />
			（1）用户发布有关宗教、种族或性别的贬损言辞；<br />
			（2）骚扰、滥用或威胁其他用户；<br />
			（3）侵犯任何第三方著作权、专利、商标、商业秘密或其它专有权利、发表权或隐私权的信息；<br />
			（4）其它任何违反互联网相关法律法规的信息。<br />
			<span class="treaty_content_h2">七、安全策略</span><br />
			（1）JquerySchoolCRM网站采取安全策略。如果用户触发了JquerySchoolCRM网站的安全机制，将被暂时或永久禁止再次访问JquerySchoolCRM网站。同时，其他用户在JquerySchoolCRM网站上发布的信息将暂时或永久不能被该用户查看；<br />
			（2）登录名，密码和安全 <br />
			&nbsp;&nbsp;&nbsp;&nbsp;在注册过程中，您可自主选择一个登录名和密码，并须对其保密性负责，同时对使用该登录名和密码的所有活动负责。您同意：<br />
			&nbsp;&nbsp;&nbsp;&nbsp;<span class="treaty_content_h3">a.对非授权使用您的登录名及密码以及其他破坏安全性的行为，用户应立即向JquerySchoolCRM网站告知，JquerySchool将采取技术措施阻止恶意破坏；<br />
			&nbsp;&nbsp;&nbsp;&nbsp;b.确保每次使用JquerySchoolCRM网站后正确地离开该站点。JquerySchoolCRM网站对您因没有遵守此协议而造成的损失不负任何法律责任。</span><br />
			<span class="treaty_content_h2">八、免费版用户的权利和义务</span><br />
			（1）免费版用户服务生效后，用户就可享受免费版相应服务内容；<br />
			（2）免费版用户在使用JquerySchoolCRM网站提供的相应服务时必须保证遵守当地及中国有关法律法规的规定；不得利用该网站进行任何非法活动。免费版用户应遵守所有与使用该网站有关的协议、规定、程序和惯例；<br />
			（3）免费版用户如需修改自己的帐户信息资料，必须接受JquerySchoolCRM网站的审核与批准。如果免费版用户使用虚假的帐户信息资料，JquerySchoolCRM有权终止其服务；<br />
			（4）用户对其输入数据的准确性、可靠性、合法性、适用性等负责；  <br />
			（5）对由于用户在使用JquerySchoolCRM网站服务的过程中，违反本协议或通过提及而纳入本协议的条款和规则或用户违反任何法律或侵犯第三方的权利而产生或引起的每一种类和性质的任何索赔、要求、诉讼、损失和损害（实际、特别及后果性的）而言，无论是已知或未知的，包括合理的律师费，用户同意就此对JquerySchool、JquerySchoolCRM网站、JquerySchool员工及其他利益相关方进行补偿并使其免受损害。<br />
			<span class="treaty_content_h2">九、JquerySchoolCRM网站的权利和义务</span><br />
			（1）为免费帐户提供JquerySchoolCRM网站承诺的服务；<br />
			（2）JquerySchoolCRM网站服务的所有权和经营权未经书面许可仅属于JquerySchool；<br />
			（3）对于因不可抗力造成的服务中断、链接受阻或其他缺陷（包括但不限于自然灾害、社会事件以及因网站所具有的特殊性质而产生的包括黑客攻击、电信部门技术调整导致的影响、政府管制而造成的暂时性关闭在内的任何影响网络正常运营的因素），JquerySchoolCRM网站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响；<br />
			（4）用户知悉，JquerySchoolCRM网站已尽最大努力来提高服务质量，但在客观上可能无法避免或排除包括错误或令人误导的服务和信息，JquerySchoolCRM网站对用户因使用JquerySchoolCRM网站而造成的损失不负法律责任。JquerySchoolCRM网站对其服务和信息不作保证，且不论什么情况下对用户因使用JquerySchoolCRM网站而造成的直接、间接、偶尔的、特殊的、惩罚性的损害或其他一切损害不负法律责任。若用户对JquerySchoolCRM网站提供的部分或所有服务不满，用户唯一的补救措施是停止使用这些服务;  <br />
			（5）如因JquerySchoolCRM网站原因，造成免费版用户服务的中断，JquerySchoolCRM网不承担任何责任，JquerySchoolCRM网站也不承担由此致使用户蒙受的其它方面的连带损失；  <br />
			（6）JquerySchoolCRM网站有权决定删除免费版帐户张贴的任何违反中国法律、法规、《JquerySchoolCRM免费版用户协议》内容，或其他JquerySchoolCRM网站认为不可接受的内容。情节严重者，JquerySchoolCRM网站有权取消其用户资格。  <br />
			<span class="treaty_content_h2">十、JquerySchoolCRM网站对所收集信息的声明</span><br />
			（1）如果您希望成为JquerySchoolCRM网站的用户，您必须注册并提供相应的信息。当您在JquerySchoolCRM网站注册帐户时，视为您同意将您的姓名、电子邮箱等信息提供给JquerySchoolCRM网站。当您浏览JquerySchoolCRM网站时，视为您同意服务器自动收集您的 IP 地址（此 IP 地址只被计算机用来向您发送相关的页面 , 帮助您监控非授权登陆所用）。<br />
			（2）JquerySchoolCRM网站的免费版用户可以发布商业信息，JquerySchoolCRM网站有权审核并删除相关信息。 所有的用户对其发布信息的准确性、完整性、即时性、合法性都独立承担所有责任，JquerySchoolCRM网站不承担由此引至的任何法律责任。JquerySchoolCRM网站在任何情况下均不就用户因本网站、本网站的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。<br />
			（3）本协议的任何规定均不得被视为JquerySchool向用户授予任何JquerySchoolCRM网站的任何专有权或所有权。任何未经授权的网站数据复制，或未经许可的基于JquerySchoolCRM网站的商业行为，JquerySchoolCRM网站将保留追究其法律责任的权利。<br />
			（4）为了向您提供产品和服务，您同意授权我们以我们认为适当的方式收集并使用用户信息。未经用户同意，JquerySchool不得以营利为目的向第三方披露用户信息，除非：<br />
			a.您允许我们披露用户信息；<br />
			b.有关法律法规或行政规章要求我们披露您的用户信息；<br />
			c.司法机关或行政机关基于法定程序要求我们披露您的用户信息；<br />
			d.为保护我们的知识产权和其他财产权益，需要披露您的用户信息；<br />
			e.在紧急情况下为保护其他用户和社会大众的人身安全，需要披露您的用户信息。<br />
			我们将采取商业上合理的方式以保护您的用户信息的安全。我们将使用通常可以获得的安全技术和程序来保护您的用户信息不被未经授权的访问、使用或泄漏。对于非因我们的疏忽而造成您账号的丢失或您用户信息的泄密，我们不承担任何责任。<br />
			<span class="treaty_content_h2">十一、最终解释权</span><br />
			&nbsp;&nbsp;&nbsp;&nbsp;我们保留对本协议条款、产品和服务以及我们所提供的产品和服务的相关官方网站的最终解释权。<br />
			<span class="treaty_content_h2">十二、版权声明</span><br />
			&nbsp;&nbsp;&nbsp;&nbsp;JquerySchoolCRM网站的所有内容版权属JquerySchool所有，严禁未经JquerySchool书面许可的任何形式的部分或全部拷贝使用。版权所有翻版必究。  <br />
			<span class="treaty_content_h2">十三、责任免除</span><br />
			（1）北京易多客信息技术有限公司及其代理商对“服务”及其内容的有效性 、正确性 、质量 、稳定性 、可靠性、及时性、适用性、真实性、实用性、准确性或完整性等均不作任何陈述、承诺或保证；<br />
			（2）用户理解并接受任何信息资料的传输取决于用户自己并由其承担系统受损或资料丢失的所有风险和责任；<br />
			（3）JquerySchoolCRM网站对用户之间的商业进程不作任何明示或暗示的承诺与保证；<br />
			（4）JquerySchoolCRM网站、员工、所有者及代理对用户使用JquerySchoolCRM网站上公布的信息而造成的损失或伤害以及用户相信JquerySchoolCRM网站上公布的信息内容而做出的决定或采取的行动不负责任；<br />
			（5）JquerySchoolCRM网站、员工、所有者及代理对用户使用或无法使用JquerySchoolCRM网站的服务而造成的直接的、间接的、偶尔的、特殊的或其他损害不负法律责任。<br />
			<span class="treaty_content_h2">十四、争议的解决 </span><br />
			&nbsp;&nbsp;&nbsp;&nbsp;此协议适用中华人民共和国法律；如与此协议有关的某一特定事项缺乏明确法律规定，则应参照通用的国际商业惯例和行业惯例。因本合同引起的或与本合同有关的任何争议，均提请北京仲裁委员会按照该会仲裁规则进行仲裁。仲裁裁决是终局的，对双方均有约束力。<br />
		</p>
	</div>
</div> -->

<!-- 弹窗——合并联系人提示 -->
<!-- <div class="popwin_mergeContacts" style="display:none">
	<p class="popwin_title">
		合并联系人
	</p>
	<div class="popwin_content" style="margin-top:0;">
		<p style="text-align:left;">　　JquerySchool新上线了合并重复联系人的功能，你还没有试用过呢！合并重复联系人能马上帮你智能归整联系人信息，未来在添加联系人的时候再也不用顾虑不小心重复录入或导入数据了。信息洁癖者的不二之选！</p>
		<a class="button btn_blue popwin_mergeContactsTry" style="margin-right:20px;margin-top:20px">现在就试试</a>
		<a class="button btn_blue popwin_mergeContactsIgnore">下次再说</a>
	</div>
</div>
 -->

</body>
</html>
