/*
全国城市天气情况  2016/7/20 由唐凯编辑
*/


var pac=[
	{"id":"001","pac_name":"北京"}, {"id":"002","pac_name":"天津"}, {"id":"003","pac_name":"上海"}, {"id":"004","pac_name":"重庆"}, {"id":"005","pac_name":"河北"}, {"id":"006","pac_name":"山西"},
	{"id":"007","pac_name":"内蒙古"}, {"id":"008","pac_name":"辽宁"}, {"id":"009","pac_name":"吉林"}, {"id":"010","pac_name":"黑龙江"}, {"id":"011","pac_name":"江苏"}, {"id":"012","pac_name":"浙江"},
	{"id":"013","pac_name":"安徽"}, {"id":"014","pac_name":"福建"}, {"id":"015","pac_name":"江西"}, {"id":"016","pac_name":"山东"}, {"id":"017","pac_name":"河南"}, {"id":"018","pac_name":"湖北"},
	{"id":"019","pac_name":"湖南"}, {"id":"020","pac_name":"广东"}, {"id":"021","pac_name":"广西"}, {"id":"022","pac_name":"海南"}, {"id":"023","pac_name":"四川"}, {"id":"024","pac_name":"贵州"},
	{"id":"025","pac_name":"云南"}, {"id":"026","pac_name":"西藏"}, {"id":"027","pac_name":"陕西"}, {"id":"028","pac_name":"甘肃"}, {"id":"029","pac_name":"青海"}, {"id":"030","pac_name":"宁夏"},
	{"id":"031","pac_name":"新疆"}
];
var city= {
	"province_bj": {"city_bj": ["北京"]},
	"province_tj":  {"city_bj": ["天津"]},
	"province_sh": {"city_bj":["上海"]},
	"province_cq": {"city_bj":["重庆"]},
	"province_heb":{"city_bj":["石家庄","张家口","承德","秦皇岛","唐山","廊坊","保定","衡水","沧州","邢台","邯郸"]},
	"province_sx": {"city_bj":["太原","朔州","大同","阳泉","长治","晋城","忻州","晋中","临汾","吕梁","运城"]},
	"province_nmg":{"city_bj":["呼和浩特","包头","乌海","赤峰","通辽","鄂尔多斯","乌兰","巴彦","兴安"]},
	"province_ln":{"city_bj":["沈阳","朝阳","阜新","铁岭","抚顺","本溪","辽阳","鞍山","丹东","大连","营口","盘锦","锦州","葫芦岛"]},
	"province_jl":{"city_bj":["长春","白城","松原","吉林","四平","辽源","通化","白山"]},
	"province_hlj":{"city_bj":["哈尔滨","齐齐哈尔","七台河","黑河","大庆","鹤岗","伊春","佳木斯","双鸭山","鸡西","牡丹江","绥化","大兴安岭"]},
	"province_js":{"city_bj":["南京","徐州","连云港","宿迁","淮安","盐城","扬州","泰州","南通","镇江","常州","无锡","苏州"]},
	"province_zj":{"city_bj":["杭州","湖州","嘉兴","舟山","宁波","绍兴","衢州","金华","台州","温州","丽水"]},
	"province_ah":{"city_bj":["合肥","宿州","淮北","亳州","阜阳","蚌埠","淮南","滁州","马鞍山","芜湖","铜陵","安庆","黄山","六安","巢湖","池州","宣城"]},
	"province_fj":{"city_bj":["福州","南平","莆田","三明","泉州","厦门","漳州","龙岩","宁德"]},
	"province_jx":{"city_bj":["南昌","九江","景德镇","鹰潭","新余","萍乡","赣州","上饶","抚州","宜春","吉安"]},
	"province_sd":{"city_bj":["济南","青岛","聊城","德州","东营","淄博","潍坊","烟台","威海","日照","临沂","枣庄","济宁","泰安","莱芜","滨州","菏泽"]},
	"province_hen":{"city_bj":["郑州","开封","三门峡","洛阳","焦作","新乡","鹤壁","安阳","濮阳","商丘","许昌","漯河", "平顶山","南阳","信阳","周口","驻马店","济源"]},
	"province_hub":{"city_bj":["武汉","十堰","襄樊","荆门","孝感","黄冈","鄂州","黄石","咸宁","荆州","宜昌","随州","恩施"]},
	"province_hun":{"city_bj":["长沙","张家界","常德","益阳","岳阳","株洲","湘潭","衡阳","郴州","永州","邵阳","怀化","娄底"]},
	"province_gd":{"city_bj":["广州","深圳","清远","韶关","河源","梅州","潮州","汕头","揭阳","汕尾","惠州","东莞","珠海","中山", "江门","佛山","肇庆","云浮","阳江","茂名","湛江"]},
	"province_gx":{"city_bj":["南宁","桂林","柳州","梧州","贵港","玉林","钦州","北海","防城港","崇左","百色","河池","来宾","贺州"]},
	"province_hain":{"city_bj":["海口","三亚"]},
	"province_sc":{"city_bj":["成都","广元","绵阳","德阳","南充","广安","遂宁","内江","乐山","自贡","泸州","宜宾","攀枝花", "巴中","达州","资阳","眉山","雅安","阿坝","甘孜","凉山"]},
	"province_gz":{"city_bj":["贵阳","遵义","安顺","毕节","铜仁","黔西"]},
	"province_yn":{"city_bj":["昆明","曲靖","玉溪","保山","昭通","丽江","思茅","临沧","德宏","怒江","迪庆","大理","楚雄","红河","文山"]},
	"province_xz":{"city_bj":["拉萨","那曲","昌都","林芝","山南","日喀则","阿里"]},
	"province_shanxi":{"city_bj":["西安","延安","铜川","渭南","咸阳","宝鸡","汉中","榆林","安康","商洛"]},
	"province_gs":{"city_bj":["兰州","嘉峪关","白银","天水","武威","酒泉","张掖","庆阳","平凉","定西","陇南","临夏","甘南"]},
	"province_qh":{"city_bj":["西宁","海东","海北","海南","黄南","果洛","玉树","海西"]},
	"province_lx":{"city_bj":["银川","石嘴山","吴忠","固原","中卫"]},
	"province_xj":{"city_bj":["乌鲁木齐","克拉玛依","喀什","阿克苏","和田", "吐鲁番","哈密","昌吉","塔城","阿勒泰"]}


};
$(function(){
	$(".btn").click(function(){
		$(".cityBox").show();
		var province=[];
		var id=[];
		var str=eval(pac);
		for(var i=0;i<str.length;i++) {
			province[i] = str[i].pac_name;
			id[i] = str[i].id;
			var li ="<li value="+id[i]+" onclick='cityFun(this)'>"+ province[i]+"</li>";
			$("#province").append(li)
		}

	});
});
function cityFun(a){
	var str1=eval(city);
	var bj=str1.province_bj;
	var tj=str1.province_tj;
	var sh=str1.province_sh;
	var cq=str1.province_cq;
	var heb=str1.province_heb;
	var sx=str1.province_sx;
	var nmg=str1.province_nmg;
	var ln=str1.province_ln;
	var jl=str1.province_jl;
	var hlj=str1.province_hlj;
	var js=str1.province_js;
	var zj=str1.province_zj;
	var ah=str1.province_ah;
	var fj=str1.province_fj;
	var jx=str1.province_jx;
	var sd=str1.province_sd;
	var hen=str1.province_hen;
	var hub=str1.province_hub;
	var hun=str1.province_hun;
	var gd=str1.province_gd;
	var gx=str1.province_gx;
	var hain=str1.province_hain;
	var sc=str1.province_sc;
	var gz=str1.province_gz;
	var yn=str1.province_yn;
	var xz=str1.province_xz;
	var shanxi=str1.province_shanxi;
	var gs=str1.province_gs;
	var qh=str1.province_qh;
	var lx=str1.province_lx;
	var xj=str1.province_xj;
	if($(a).val() == "001"){
		for(var i=0;i<bj.city_bj.length;i++){
			var li="<li onclick='cityBtn(this)'>"+ bj.city_bj[i]+"</li>";
			$("#city").html(li)
		}
	} else if($(a).val() == "002"){
		for(var i=0;i<tj.city_bj.length;i++){
			var li="<li onclick='cityBtn(this)'>"+ tj.city_bj[i]+"</li>";
			$("#city").html(li)
		}
	} else if($(a).val() == "003"){
		for(var i=0;i<sh.city_bj.length;i++){
			var li="<li onclick='cityBtn(this)'>"+ sh.city_bj[i]+"</li>";
			$("#city").html(li)
		}
	} else if($(a).val() == "004"){
		for(var i=0;i<cq.city_bj.length;i++){
			var li="<li onclick='cityBtn(this)'>"+ cq.city_bj[i]+"</li>";
			$("#city").html(li)
		}
	} else if($(a).val() == "005"){
		var heblis=[];
		for(var i=0;i<heb.city_bj.length;i++){
			heblis[i]="<li onclick='cityBtn(this)'>"+ heb.city_bj[i]+"</li>";
			$("#city").html(heblis);
		}
	}else if($(a).val() == "006") {
		var sxlis = [];
		for (var i = 0; i < heb.city_bj.length; i++) {
			sxlis[i] = "<li onclick='cityBtn(this)'>" + sx.city_bj[i] + "</li>";
			$("#city").html(sxlis);
		}
	}else if($(a).val() == "007"){
		var nmglis=[];
		for(var i=0;i<nmg.city_bj.length;i++){
			nmglis[i]="<li onclick='cityBtn(this)'>"+ nmg.city_bj[i]+"</li>";
			$("#city").html(nmglis);
		}
	}else if($(a).val() == "008"){
		var lnlis=[];
		for(var i=0;i<ln.city_bj.length;i++){
			lnlis[i]="<li onclick='cityBtn(this)'>"+ ln.city_bj[i]+"</li>";
			$("#city").html(lnlis);
		}
	}else if($(a).val() == "009"){
		var jllis=[];
		for(var i=0;i<jl.city_bj.length;i++){
			jllis[i]="<li onclick='cityBtn(this)'>"+ jl.city_bj[i]+"</li>";
			$("#city").html(jllis);
		}
	}else if($(a).val() == "010"){
		var hljlis=[];
		for(var i=0;i<hlj.city_bj.length;i++){
			hljlis[i]="<li onclick='cityBtn(this)'>"+ hlj.city_bj[i]+"</li>";
			$("#city").html(hljlis);
		}
	}else if($(a).val() == "011"){
		var jslis=[];
		for(var i=0;i<js.city_bj.length;i++){
			jslis[i]="<li onclick='cityBtn(this)'>"+ js.city_bj[i]+"</li>";
			$("#city").html(jslis);
		}
	}else if($(a).val() == "012"){
		var zjlis=[];
		for(var i=0;i<zj.city_bj.length;i++){
			zjlis[i]="<li onclick='cityBtn(this)'>"+ zj.city_bj[i]+"</li>";
			$("#city").html(zjlis);
		}
	}else if($(a).val() == "013"){
		var ahlis=[];
		for(var i=0;i<ah.city_bj.length;i++){
			ahlis[i]="<li onclick='cityBtn(this)'>"+ ah.city_bj[i]+"</li>";
			$("#city").html(ahlis);
		}
	}else if($(a).val() == "014"){
		var fjlis=[];
		for(var i=0;i<fj.city_bj.length;i++){
			fjlis[i]="<li onclick='cityBtn(this)'>"+ fj.city_bj[i]+"</li>";
			$("#city").html(fjlis);
		}
	}else if($(a).val() == "015"){
		var jxlis=[];
		for(var i=0;i<jx.city_bj.length;i++){
			jxlis[i]="<li onclick='cityBtn(this)'>"+ jx.city_bj[i]+"</li>";
			$("#city").html(jxlis);
		}
	}else if($(a).val() == "016"){
		var sdlis=[];
		for(var i=0;i<sd.city_bj.length;i++){
			sdlis[i]="<li onclick='cityBtn(this)'>"+ sd.city_bj[i]+"</li>";
			$("#city").html(sdlis);
		}
	}else if($(a).val() == "017"){
		var henlis=[];
		for(var i=0;i<hen.city_bj.length;i++){
			henlis[i]="<li onclick='cityBtn(this)'>"+ hen.city_bj[i]+"</li>";
			$("#city").html(henlis);
		}
	}else if($(a).val() == "018"){
		var hublis=[];
		for(var i=0;i<hub.city_bj.length;i++){
			hublis[i]="<li onclick='cityBtn(this)'>"+ hub.city_bj[i]+"</li>";
			$("#city").html(hublis);
		}
	}else if($(a).val() == "019"){
		var hunlis=[];
		for(var i=0;i<hun.city_bj.length;i++){
			hunlis[i]="<li onclick='cityBtn(this)'>"+ hun.city_bj[i]+"</li>";
			$("#city").html(hunlis);
		}
	}else if($(a).val() == "020"){
		var gdlis=[];
		for(var i=0;i<gd.city_bj.length;i++){
			gdlis[i]="<li onclick='cityBtn(this)'>"+ gd.city_bj[i]+"</li>";
			$("#city").html(gdlis);
		}
	}else if($(a).val() == "021"){
		var gxlis=[];
		for(var i=0;i<gx.city_bj.length;i++){
			gxlis[i]="<li onclick='cityBtn(this)'>"+ gx.city_bj[i]+"</li>";
			$("#city").html(gxlis);
		}
	}else if($(a).val() == "022"){
		var hainlis=[];
		for(var i=0;i<hain.city_bj.length;i++){
			hainlis[i]="<li onclick='cityBtn(this)'>"+ hain.city_bj[i]+"</li>";
			$("#city").html(hainlis);
		}
	}else if($(a).val() == "023"){
		var sclis=[];
		for(var i=0;i<sc.city_bj.length;i++){
			sclis[i]="<li onclick='cityBtn(this)'>"+ sc.city_bj[i]+"</li>";
			$("#city").html(sclis);
		}
	}else if($(a).val() == "024"){
		var gzlis=[];
		for(var i=0;i<gz.city_bj.length;i++){
			gzlis[i]="<li onclick='cityBtn(this)'>"+ gz.city_bj[i]+"</li>";
			$("#city").html(gzlis);
		}
	}else if($(a).val() == "025"){
		var ynlis=[];
		for(var i=0;i<yn.city_bj.length;i++){
			ynlis[i]="<li onclick='cityBtn(this)'>"+ yn.city_bj[i]+"</li>";
			$("#city").html(ynlis);
		}
	}else if($(a).val() == "026"){
		var xzlis=[];
		for(var i=0;i<xz.city_bj.length;i++){
			xzlis[i]="<li onclick='cityBtn(this)'>"+ xz.city_bj[i]+"</li>";
			$("#city").html(xzlis);
		}
	}else if($(a).val() == "027"){
		var shanxilis=[];
		for(var i=0;i<shanxi.city_bj.length;i++){
			shanxilis[i]="<li onclick='cityBtn(this)'>"+ shanxi.city_bj[i]+"</li>";
			$("#city").html(shanxilis);
		}
	}else if($(a).val() == "028"){
		var gslis=[];
		for(var i=0;i<gs.city_bj.length;i++){
			gslis[i]="<li onclick='cityBtn(this)'>"+ gs.city_bj[i]+"</li>";
			$("#city").html(gslis);
		}
	}else if($(a).val() == "029"){
		var qhlis=[];
		for(var i=0;i<qh.city_bj.length;i++){
			qhlis[i]="<li onclick='cityBtn(this)'>"+ qh.city_bj[i]+"</li>";
			$("#city").html(qhlis);
		}
	}else if($(a).val() == "030"){
		var lxlis=[];
		for(var i=0;i<lx.city_bj.length;i++){
			lxlis[i]="<li onclick='cityBtn(this)'>"+ lx.city_bj[i]+"</li>";
			$("#city").html(lxlis);
		}
	}
	else if($(a).val() == "031"){
		var xjlis=[];
		for(var i=0;i<xj.city_bj.length;i++){
			xjlis[i]="<li onclick='cityBtn(this)'>"+ xj.city_bj[i]+"</li>";
			$("#city").html(xjlis);
		}
	}

}
function typeFun(b,c){
	if(b=="晴"){
		c.src="./img/1.png"
	}else if(b=="多云"){
		c.src="./img/2.png"
	}else if(b=="晴转多云" ||b=="阴" || b=="多云"){
		c.src="./img/3.png"
	} else if(b=="小雨"){
		c.src="./img/4.png"
	}else if(b=="中雨" || b=="大雨"){
		c.src="./img/5.png"
	}else if(b=="雷雨" || b=="雷阵雨"){
		c.src="./img/6.png"
	}else if(b=="雨夹雪"){
		c.src="./img/7.png"
	} else if(b=="中雪"){
		c.src="./img/8.png"
	} else if(b=="大雪"){
		c.src="./img/9.png"
	}
}
function bgFun(b){
	//if(b=="晴"){
	//	$(".content").css("background","url(../img/qing.jpg) no-repeat 0 0");
	//}else if(b=="晴转多云" || b=="阴" || b=="多云"){
	//	$(".content").css("background","url(../img/duoyun.png) no-repeat 0 0");
	//}else if(b=="小雨" || b=="中雨" ||b=="大雨"){
	//	$(".content").css("background","url(../img/yu.jpg) no-repeat 0 0");
	//}else if(b=="雷雨" || b=="雷阵雨"){
	//	$(".content").css("background","url(../img/leiyu.png) no-repeat 0 0");
	//}
}



