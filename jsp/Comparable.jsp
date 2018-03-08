
<fieldset class="fieldstyle" ng-disabled="isAppraiserSigned()" check-if-required>                   
    <legend class="legendstyle" ng-click="toggleElement('comparable', $event)">&nbsp;-&nbsp;COMPARABLE SALES DATA</legend>

    <!-- test top-->


<!--     <h2>Responsive collapse (by column)</h2>
    <div class="Rtable Rtable--4cols Rtable--collapse">

        <div style="order:0;" class="Rtable-cell aaa Rtable-cell--head"><h3>Subject</h3></div>
        <div style="order:1;" class="Rtable-cell aaa">900 Don Mills Rd</div>
        <div style="order:2;" class="Rtable-cell aaa">Toronto, ON</div>
        <div style="order:3;" class="Rtable-cell aaa Rtable-cell--foot"><strong>M3C 1V6</strong></div>

        <div style="order:0;" class="Rtable-cell aaa Rtable-cell--head"><h3>Comparable 1</h3></div>
        <div style="order:1;" class="Rtable-cell aaa">111 Leithhill Rd</div>
        <div style="order:2;" class="Rtable-cell aaa">Toronto, ON</div>
        <div style="order:3;" class="Rtable-cell aaa Rtable-cell--foot"><strong>M1J 1C1</strong></div>

        <div style="order:0;" class="Rtable-cell bbb Rtable-cell--head"><h3>Comparable 2</h3></div>
        <div style="order:1;" class="Rtable-cell bbb">222 Shepherd</div>
        <div style="order:2;" class="Rtable-cell bbb">Toronto, ON</div>
        <div style="order:3;" class="Rtable-cell bbb Rtable-cell--foot"><strong>M2J 2B2</strong></div>

        <div style="order:0;" class="Rtable-cell bbb Rtable-cell--head"><h3>Comparable 3</h3></div>
        <div style="order:1;" class="Rtable-cell bbb">3333 Finch Ave E</div>
        <div style="order:2;" class="Rtable-cell bbb">Toronto, ON</div>
        <div style="order:3;" class="Rtable-cell bbb Rtable-cell--foot"><strong>M3H 3G3</strong></div>

    </div> -->




    <!-- test bottom -->







    <div id="comparables" class="reportSection" ng-hide="oToggleElementList['comparable']">

        
        <!-- TABLES -->

        <div class="Rtable Rtable--2cols Rtable-outer-collapse">
            <div style="order:0;" class="Rtable-cell ">
                <div class="Rtable Rtable--2cols Rtable--collapse">

                    <!-- TABLE subject -->
                        <!-- s:head-->
                        <div style="order:0;" class="Rtable-cell subject Rtable-cell--head">
                            <label>SUBJECT</label>
                        </div>
                        <!-- s:1 -->
                        <div style="order:1;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>PROPERTY ADDRESS:</label>
                            </div>
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="subject_address1" name="subject_address1" ng-value="property_address">
                                </div>
                            </div>
                        </div>
                        <!-- s:2 -->
                        <div style="order:2;" class="Rtable-cell subject">&nbsp;</div>
                        <!-- s:3 -->
                        <div style="order:3;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>CITY - PROV</label>
                            </div> 
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="subject_address13" name="subject_address13" ng-value="getSubjCityProv()">   
                                </div>
                            </div> 
                        </div>
                        <!-- s:4 -->
                        <div style="order:4;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>POSTAL CODE</label>
                            </div>
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="subject_postalcode" name="subject_postalcode" ng-value="subj_postal_code">
                                </div>
                            </div>
                        </div>
                        <!-- s:5 -->
                        <div style="order:5;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>APPROX. DIST. FROM SUB.</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="dis_subj" name="dis_subj" ng-value="dis_subj">
                                </div>
                            </div>
                        </div>
                        <!-- s:6 -->
                        <div style="order:6;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>DATE OF SALE</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input name="date_of_sale_subject" id="date_of_sale_subject" ng-model="date_of_sale_subject" type="text" value="" width="250" maxlength="80" force-model-updatreadonly="true" />                             
                                    <img onclick='showCalendar(this, date_of_sale_subject, "yyyy-mm-dd",null,1,-1,-1)' src="<%=appUrl%>/Themes/popcalendar.png" alt="" />
                                </div>
                            </div>
                        </div>
                        <!-- s:7 -->
                        <div style="order:7;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>SALE PRICE</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="sale_price_subj" name="sale_price_subj" ng-model="sale_price_subj"  force-model-update>                                     
                                </div>
                            </div>  
                        </div>
                        <!-- s:8 -->
                        <div style="order:8;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>DAYS ON MARKET</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="day_subj" name="day_subj" ng-model="day_subj"  force-model-update>                                     
                                </div>
                            </div> 
                        </div>
                        <!-- s:9 -->
                        <div style="order:9;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>SITE SIZE</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="site_size_subj_1" name="site_size_subj_1" ng-value="site_dims">
                                </div>
                                <div class="input-text">
                                    <label>X</label>
                                    <input type="text" id="site_size_subj_2" name="site_size_subj_2" ng-value="site_dims2">   
                                </div>
                                <div class="input-text">
                                    <input type="hidden" id="site_size_subj" name="site_size_subj" ng-model="site_size_subj"  force-model-update>      
                                </div>
                            </div> 
                        </div>
                        <!-- s:10 -->
                        <div style="order:10;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>BUILDING TYPE</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="build_type_subj" name="build_type_subj" ng-value="type_building">     
                                </div>
                            </div>
                        </div>
                        <!-- s:11 -->
                        <div style="order:11;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>DESIGN/STYLE</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="design_style_subj" name="design_style_subj" ng-value="design_style">                            
                                </div>
                            </div>
                        </div>
                        <!-- s:12 -->
                        <div style="order:12;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>AGE/CONDITION</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <!-- The following input field value is carried on from another one in Neighbourhood.jsp, it should be initialised by ng-value other than JavaScript or JQuery command anymore -->                              
                                    <input type="text" id="age_subj" name="age_subj" ng-value="estimated_subj_age">
                                </div>
                                <div class="input-text"> 
                                    <input type="text" id="condition_subj" name="condition_subj" ng-model="condition_subj"  force-model-update>    
                                </div>
                            </div>
                        </div>
                        <!-- s:13 -->
                        <div style="order:13;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>GROSS LIVING AREA</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text"> 
                                    <input type="text" id="floor_area_subj" name="floor_area_subj" ng-model="floor_area_subj"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <select id="live_floor_area_type_subj" name="live_floor_area_type_subj" ng-model="live_floor_area_type_subj" force-model-update>
                                        <option>SQFT</option>
                                        <option>SQM</option>    
                                    </select>  
                                </div>
                            </div>
                        </div>
                        <!-- s:14 -->
                        <div style="order:14;" class="Rtable-cell subject">
                            <div class="form-row">&nbsp;</div>

                            <div class="labels-group">
                                <label>Total</label>
                                <label>Bdrms</label>                                       
                            </div>
                        </div>
                        <!-- s:15 -->
                        <div style="order:15;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>ROOM COUNT</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="total_subj" name="total_subj" ng-model="total_subj"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <input type="text" id="bdrms_subj" name="bdrms_subj" ng-model="bdrms_subj"  force-model-update>         
                                </div>
                            </div>   
                        </div>
                        <!-- s:16 -->
                        <div style="order:16;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>BATHROOM COUNT</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="baths_subj" name="baths_subj" ng-model="baths_subj"  force-model-update> 

                                    <input type="button" id="bathroom_count_button_cp0" name="bathroom_count_button_cp0" ng-model="bathroom_count_button_cp0"  force-model-update>                                   
                                </div>
                            </div>
                        </div>
                        <!-- s:17 -->
                        <div style="order:17;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>BASEMENT</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="basement_subj" name="basement_subj" ng-value="basement">
                                </div>
                            </div>
                        </div>
                        <!-- s:18 -->
                        <div style="order:18;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>PARKING</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="parking_subj" name="parking_subj" ng-model="parking_subj"  force-model-update>  
                                </div>
                            </div>
                        </div>
                        <!-- s:19 -->
                        <div style="order:19;" class="Rtable-cell subject">
                            <div class="form-row">
                                <label>DRIVEWAY</label>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="driveway_subj" name="driveway_subj" ng-model="driveway_subj"  force-model-update>      
                                </div>
                            </div>
                        </div>
                        <!-- s:20 -->
                        <div style="order:20;" class="Rtable-cell subject">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" placeholder="Extra 1" id="extra1_title" name="extra1_title" ng-model="extra1_title"  force-model-update>  
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="extra1" name="extra1" ng-model="extra1"  force-model-update>    
                                </div>
                            </div>
                        </div>
                        <!-- s:21 -->
                        <div style="order:21;" class="Rtable-cell subject">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" placeholder="Extra 2" id="extra2_title" name="extra2_title" ng-model="extra2_title"  force-model-update>      
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="extra5" name="extra5" ng-model="extra5"  force-model-update>  
                                </div>
                            </div>
                        </div>
                        <!-- <div style="order:3;" class="Rtable-cell aaa Rtable-cell--foot"><strong>footer subject</strong></div> -->

                    <!-- TABLE comparable 1 -->
                        <!-- 1:head-->
                        <div style="order:0;" class="Rtable-cell comparable1 Rtable-cell--head">
                            <label>COMPARABLE NO.1</label>
                        </div>
                        <!-- c1:1-->
                        <div style="order:1;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" placeholder="ST. NO." id="stnbr_comp1" name="stnbr_comp1" ng-model="stnbr_comp1"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <input type="text" placeholder="ST. NAME" id="address_compare1" name="address_compare1" ng-model="address_compare1"  force-model-update>                             
                                </div>
                            </div>
                        </div>
                        <!-- c1:2-->
                        <div style="order:2;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" placeholder="ST. TYPE" id="sttype_comp1" name="sttype_comp1" ng-model="sttype_comp1"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <input type="text" placeholder="ST. DIR" id="stdir_comp1" name="stdir_comp1" ng-model="stdir_comp1"  force-model-update> 
                                </div>
                                <div class="input-text">
                                    <input type="text" placeholder="ST. UNIT" id="address_compare12" name="address_compare12" ng-model="address_compare12"  force-model-update>                                                                  
                                </div>
                            </div>
                        </div>
                        <!-- c1:3 -->
                        <div style="order:3;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" placeholder="CITY" id="address_compare13" name="address_compare13" ng-model="address_compare13"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <input type="text" placeholder="PROVINCE" id="prov_comp1" name="prov_comp1" ng-model="prov_comp1"  force-model-update>                               
                                </div>
                            </div>
                        </div>
                        <!-- c1:4 -->
                        <div style="order:4;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="postalCode_comp1" name="postalCode_comp1" ng-model="postalCode_comp1"  force-model-update>
                                </div>
                            </div>
                        </div>
                        <!-- c1:5 -->
                        <div style="order:5;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="dis_comp1" name="dis_comp1" ng-model="dis_comp1"  force-model-update>
                                </div>
                            </div>
                        </div>
                        <!-- c1:6 -->
                        <div style="order:6;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input name="date_of_sale1" id="date_of_sale1" ng-model="date_of_sale1" type="text" value="" width="250" maxlength="80" force-model-updatreadonly="true" />                             
                                    <img onclick='showCalendar(this, date_of_sale1, "yyyy-mm-dd",null,1,-1,-1)' 
                                    src="<%=appUrl%>/Themes/popcalendar.png" alt="" />    
                                </div>
                            </div>
                        </div>
                        <!-- c1:7 -->
                        <div style="order:7;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="sale_price_1" name="sale_price_1" ng-model="sale_price_1"  force-model-update>
                                </div>
                            </div>
                        </div>
                        <!-- c1:8 -->
                        <div style="order:8;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="day_comp1" name="day_comp1" ng-model="day_comp1"  force-model-update>                                     
                                </div>
                            </div> 
                        </div>
                        <!-- c1:9 -->
                        <div style="order:9;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="site_size1" name="site_size1" ng-model="site_size1"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <label>X</label>
                                    <input type="text" id="site_size2" name="site_size2" ng-model="site_size2"  force-model-update>    
                                </div>
                            </div>
                        </div>
                        <!-- c1:10 -->
                        <div style="order:10;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <select id="build_type1" name="build_type1" ng-model="build_type1" width="250" maxlength="80" force-model-update>
                                        <option selected></option>
                                        <option>Apartment</option>
                                        <option>Detached</option>
                                        <option>Semi-Detached</option>
                                        <option>Att/Row/Townhouse</option>
                                        <option>Link</option>
                                        <option>N/A</option>                                 
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- c1:11 -->
                        <div style="order:11;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">                            
                                    <select id="design_style1" name="design_style1" ng-model="design_style1" width="250" maxlength="80" force-model-update>
                                        <option selected></option>
                                        <option>Bungalow</option>
                                        <option>Bungalow Raised</option>
                                        <option>Bi-Level</option>
                                        <option>Loft</option>
                                        <option>1 Storey</option>
                                        <option>1 1/2 Storey</option>
                                        <option>2 Storey</option>
                                        <option>2 1/2 Storey</option>
                                        <option>3 Storey</option>
                                        <option>Backsplit 3</option>
                                        <option>Backsplit 4</option>
                                        <option>Backsplit 5</option>
                                        <option>Backsplit-All</option>
                                        <option>Sidesplit 3</option>
                                        <option>Slidesplit 4</option>
                                        <option>Sidesplit 5</option>
                                        <option>Slidesplit-All</option>
                                        <option>Frontsplit</option>
                                        <option>Multi-split</option>
                                        <option>N/A</option>
                                        <option>Other</option>                               
                                    </select> 
                                </div>
                            </div>                     
                        </div>
                        <!-- c1:12 -->
                        <div style="order:12;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">                   
                                    <input type="text" id="age1" name="age1" ng-model="age1"  force-model-update>
                                </div>
                                <div class="input-text"> 
                                    <input type="text" id="condition1" name="condition1" ng-model="condition1"  force-model-update>
                                </div>
                            </div>
                        </div>
                        <!-- c1:13 -->
                        <div style="order:13;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="floor_area1" name="floor_area1" ng-model="floor_area1"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <select id="live_floor_area_type_cp1" name="live_floor_area_type_cp1" ng-model="live_floor_area_type_cp1" force-model-update>
                                        <option>SQFT</option>
                                        <option>SQM</option>    
                                    </select> 
                                </div>
                            </div> 
                        </div>
                        <!-- c1:14 -->
                        <div style="order:14;" class="Rtable-cell comparable1">
                            <div class="labels-group">
                                <label>Total</label>
                                <label>Bdrms</label>                                       
                            </div>
                        </div>
                        <!-- c1:15 -->
                        <div style="order:15;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="total1" name="total1" ng-model="total1"  force-model-update>
                                </div>
                                <div class="input-text">
                                    <input type="text" id="bdrms1" name="bdrms1" ng-model="bdrms1"  force-model-update>     
                                </div>
                            </div>
                        </div>
                        <!-- c1:16 -->
                        <div style="order:16;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="baths1" name="baths1" ng-model="baths1"  force-model-update>

                                    <input type="button" id="bathroom_count_button_cp1" name="bathroom_count_button_cp1" ng-model="bathroom_count_button_cp1"  force-model-update>                               
                                </div>
                            </div>
                        </div>
                        <!-- c1:17 -->
                        <div style="order:17;" class="Rtable-cell comparable1">

                            <div class="form-row">
                                <div class="input-text">
                                    <select id="basement1" name="basement1" ng-model="basement1" width="250" maxlength="80" force-model-update>
                                        <option selected></option>
                                        <option>Full Finished</option>
                                        <option>Part. Finished</option>
                                        <option>Part. Bsmt</option>
                                        <option>Finished W/O</option>
                                        <option>Unfinished</option>
                                        <option>Apartment</option>
                                        <option>Half</option>
                                        <option>Crawl Space</option>
                                        <option>W/O</option>
                                        <option>N/A</option>
                                        <option>Other</option>                               
                                    </select>       
                                </div>
                            </div> 
                        </div>
                        <!-- c1:18 -->
                        <div style="order:18;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="parking1" name="parking1" ng-model="parking1"  force-model-update>
                                    <input type="button" id="parking_button_cp1" name="parking_button_cp1" ng-model="parking_button_cp1"  value="V" force-model-update>   
                                </div>
                            </div> 
                        </div>
                        <!-- c1:19 -->
                        <div style="order:19;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="driveway_1" name="driveway_1" ng-model="driveway_1"  force-model-update>   
                                </div>
                            </div>
                        </div>
                        <!-- c1:20 -->
                        <div style="order:20;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="extra2" name="extra2" ng-model="extra2"  force-model-update>  
                                </div>
                            </div> 
                        </div>
                        <!-- c1:21 -->
                        <div style="order:21;" class="Rtable-cell comparable1">
                            <div class="form-row">
                                <div class="input-text">
                                    <input type="text" id="extra6" name="extra6" ng-model="extra6"  force-model-update>   
                                </div>
                            </div>
                        </div>
                        <!-- <div style="order:3;" class="Rtable-cell Rtable-cell--foot"><strong>footer 1</strong></div> -->
                </div>
            </div>
            <div style="order:0;" class="Rtable-cell">
                <div class="Rtable Rtable--2cols Rtable--collapse">
                    <!-- TABLE comparable 2 -->

                    <!-- c2:head-->
                    <div style="order:0;" class="Rtable-cell comparable2 Rtable-cell--head">
                        <label>COMPARABLE NO.2</label>
                    </div>
                    <!-- c2:1-->
                    <div style="order:1;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" placeholder="ST. NO." id="stnbr_comp2" name="stnbr_comp2" ng-model="stnbr_comp2"  force-model-update>
                            </div>
                            <div class="input-text">
                                <input type="text" placeholder="ST. NAME" id="address_compare2" name="address_compare2" ng-model="address_compare2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:2-->
                    <div style="order:2;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" placeholder="ST. TYPE" id="sttype_comp2" name="sttype_comp2" ng-model="sttype_comp2"  force-model-update>
                            </div>
                            <div class="input-text">
                                <input type="text" placeholder="ST. DIR" id="stdir_comp2" name="stdir_comp2" ng-model="stdir_comp2"  force-model-update>
                            </div>
                            <div class="input-text">
                                <input type="text" placeholder="ST. UNIT" id="address_compare22" name="address_compare22" ng-model="address_compare22"  force-model-update>                                      
                            </div>
                        </div>
                    </div>
                    <!-- c2:3 -->
                    <div style="order:3;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" placeholder="CITY" id="address_compare23" name="address_compare23" ng-model="address_compare23"  force-model-update>
                            </div>
                            <div class="input-text">
                                <input type="text" placeholder="PROVINCE" id="prov_comp2" name="prov_comp2" ng-model="prov_comp2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:4 -->
                    <div style="order:4;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="postalCode_comp2" name="postalCode_comp2" ng-model="postalCode_comp2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:5 -->
                    <div style="order:5;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="dis_comp2" name="dis_comp2" ng-model="dis_comp2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:6 -->
                    <div style="order:6;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input name="date_of_sale2" id="date_of_sale2" ng-model="date_of_sale2" type="text" value="" width="250" maxlength="80" force-model-updatreadonly="true" />                             
                                <img onclick='showCalendar(this, date_of_sale2, "yyyy-mm-dd",null,1,-1,-1)' 
                                src="<%=appUrl%>/Themes/popcalendar.png" alt="" />                                      
                            </div>
                        </div>
                    </div>
                    <!-- c2:7 -->
                    <div style="order:7;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="sale_price2" name="sale_price2" ng-model="sale_price2"  force-model-update>                                     
                            </div>
                        </div> 
                    </div>
                    <!-- c2:8 -->
                    <div style="order:8;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="day_comp2" name="day_comp2" ng-model="day_comp2"  force-model-update>                                     
                            </div>
                        </div>
                    </div>
                    <!-- c2:9 -->
                    <div style="order:9;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="site_size2" name="site_size2" ng-model="site_size2"  force-model-update>
                            </div>
                            <div class="input-text">
                                <label>X</label>
                                <input type="text" id="site_size22" name="site_size22" ng-model="site_size22"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:10 -->
                    <div style="order:10;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <select id="build_type2" name="build_type2" ng-model="build_type2" width="250" maxlength="80" force-model-update>
                                    <option selected></option>
                                    <option>Apartment</option>
                                    <option>Detached</option>
                                    <option>Semi-Detached</option>
                                    <option>Att/Row/Townhouse</option>
                                    <option>Link</option>
                                    <option>N/A</option>                                 
                                </select>                           
                            </div>                                    
                        </div>
                    </div>
                    <!-- c2:11 -->
                    <div style="order:11;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">                            
                                <select id="design_style2" name="design_style2" ng-model="design_style2" width="250" maxlength="80" force-model-update>
                                    <option selected></option>
                                    <option>Bungalow</option>
                                    <option>Bungalow Raised</option>
                                    <option>Bi-Level</option>
                                    <option>Loft</option>
                                    <option>1 Storey</option>
                                    <option>1 1/2 Storey</option>
                                    <option>2 Storey</option>
                                    <option>2 1/2 Storey</option>
                                    <option>3 Storey</option>
                                    <option>Backsplit 3</option>
                                    <option>Backsplit 4</option>
                                    <option>Backsplit 5</option>
                                    <option>Backsplit-All</option>
                                    <option>Sidesplit 3</option>
                                    <option>Slidesplit 4</option>
                                    <option>Sidesplit 5</option>
                                    <option>Slidesplit-All</option>
                                    <option>Frontsplit</option>
                                    <option>Multi-split</option>
                                    <option>N/A</option>
                                    <option>Other</option>                               
                                </select>       
                            </div>
                        </div>    
                    </div>
                    <!-- c2:12 -->
                    <div style="order:12;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">                   
                                <input type="text" id="age2" name="age2" ng-model="age2"  force-model-update>
                            </div>
                            <div class="input-text"> 
                                <input type="text" id="condition2" name="condition2" ng-model="condition2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:13 -->
                    <div style="order:13;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">                            
                                <input type="text" id="floor_area2" name="floor_area2" ng-model="floor_area2"  force-model-update>
                            </div>
                            <div class="input-text">
                                <select id="live_floor_area_type_cp2" name="live_floor_area_type_cp2" ng-model="live_floor_area_type_cp2" force-model-update>
                                    <option>SQFT</option>
                                    <option>SQM</option>    
                                </select>              
                            </div>
                        </div>  
                    </div>
                    <!-- c2:14 -->
                    <div style="order:14;" class="Rtable-cell comparable2">
                        <div class="labels-group">
                            <label>Total</label>
                            <label>Bdrms</label>                                       
                        </div>
                    </div>
                    <!-- c2:15 -->
                    <div style="order:15;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="total2" name="total2" ng-model="total2"  force-model-update>
                            </div>
                            <div class="input-text">
                                <input type="text" id="bdrms2" name="bdrms2" ng-model="bdrms2"  force-model-update>   
                            </div>
                        </div>
                    </div>
                    <!-- c2:16 -->
                    <div style="order:16;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="baths2" name="baths2" ng-model="baths2"  force-model-update>

                                <input type="button" id="bathroom_count_button_cp2" name="bathroom_count_button_cp2" ng-model="bathroom_count_button_cp2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:17 -->
                    <div style="order:17;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <select id="basement2" name="basement2" ng-model="basement2" width="250" maxlength="80" force-model-update>
                                    <option selected></option>
                                    <option>Full Finished</option>
                                    <option>Part. Finished</option>
                                    <option>Part. Bsmt</option>
                                    <option>Finished W/O</option>
                                    <option>Unfinished</option>
                                    <option>Apartment</option>
                                    <option>Half</option>
                                    <option>Crawl Space</option>
                                    <option>W/O</option>
                                    <option>N/A</option>
                                    <option>Other</option>                               
                                </select>            
                            </div>
                        </div>  
                    </div>
                    <!-- c2:18 -->
                    <div style="order:18;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="parking2" name="parking2" ng-model="parking2"  force-model-update>
                                <input type="button" id="parking_button_cp2" name="parking_button_cp2" ng-model="parking_button_cp2"  value="V" force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:19 -->
                    <div style="order:19;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="driveway_2" name="driveway_2" ng-model="driveway_2"  force-model-update>
                            </div>
                        </div>
                    </div>
                    <!-- c2:20 -->
                    <div style="order:20;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="extra3" name="extra3" ng-model="extra3"  force-model-update> 
                            </div>
                        </div>  
                    </div>
                    <!-- c2:21 -->
                    <div style="order:21;" class="Rtable-cell comparable2">
                        <div class="form-row">
                            <div class="input-text">
                                <input type="text" id="extra7" name="extra7" ng-model="extra7"  force-model-update>
                            </div>
                        </div> 
                    </div>
                    <!-- <div style="order:3;" class="Rtable-cell Rtable-cell--foot"><strong>footer 2</strong></div> -->

                    <!-- TABLE comparable 3 -->
                <!-- 3:head-->
                <div style="order:0;" class="Rtable-cell comparable3 Rtable-cell--head">
                    <label>COMPARABLE NO.3</label>
                </div>
                <!-- c3:1-->
                <div style="order:1;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" placeholder="ST. NO." id="stnbr_comp3" name="stnbr_comp3" ng-model="stnbr_comp3"  force-model-update>                                 
                        </div>
                        <div class="input-text">
                            <input type="text" placeholder="ST. NAME" id="address_compare3" name="address_compare3" ng-model="address_compare3"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:2-->
                <div style="order:2;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" placeholder="ST. TYPE" id="sttype_comp3" name="sttype_comp3" ng-model="sttype_comp3"  force-model-update>    
                        </div>
                        <div class="input-text">                             
                            <input type="text" placeholder="ST. DIR" id="stdir_comp3" name="stdir_comp3" ng-model="stdir_comp3"  force-model-update>
                        </div>
                        <div class="input-text">
                            <input type="text" placeholder="ST. UNIT" id="address_compare32" name="address_compare32" ng-model="address_compare32"  force-model-update>                                      
                        </div>
                    </div>
                </div>
                <!-- c3:3 -->
                <div style="order:3;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" placeholder="CITY" id="address_compare33" name="address_compare33" ng-model="address_compare33"  force-model-update>                                  
                        </div>
                        <div class="input-text">
                            <input type="text" placeholder="PROVINCE" id="prov_comp3" name="prov_comp3" ng-model="prov_comp3"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:4 -->
                <div style="order:4;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="postalCode_comp3" name="postalCode_comp3" ng-model="postalCode_comp3"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:5 -->
                <div style="order:5;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="dis_comp3" name="dis_comp3" ng-model="dis_comp3"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:6 -->
                <div style="order:6;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input name="date_of_sale3" id="date_of_sale3" ng-model="date_of_sale3" type="text" value="" width="250" maxlength="80" force-model-updatreadonly="true" />                             
                            <img onclick='showCalendar(this, date_of_sale3, "yyyy-mm-dd",null,1,-1,-1)' 
                            src="<%=appUrl%>/Themes/popcalendar.png" alt="" />                                      
                        </div>
                    </div> 
                </div>
                <!-- c3:7 -->
                <div style="order:7;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="sale_price3" name="sale_price3" ng-model="sale_price3"  force-model-update>                                     
                        </div>
                    </div> 
                </div>
                <!-- c3:8 -->
                <div style="order:8;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="day_comp3" name="day_comp3" ng-model="day_comp3"  force-model-update>                                     
                        </div>
                    </div> 
                </div>
                <!-- c3:9 -->
                <div style="order:9;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="site_size3" name="site_size3" ng-model="site_size3"  force-model-update>
                        </div>
                        <div class="input-text">

                            <label>X</label>                                   
                            <input type="text" id="site_size32" name="site_size32" ng-model="site_size32"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:10 -->
                <div style="order:10;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <select id="build_type3" name="build_type3" ng-model="build_type3" width="250" maxlength="80" force-model-update>
                                <option selected></option>
                                <option>Apartment</option>
                                <option>Detached</option>
                                <option>Semi-Detached</option>
                                <option>Att/Row/Townhouse</option>
                                <option>Link</option>
                                <option>N/A</option>                                 
                            </select>   
                        </div>
                    </div>     
                </div>
                <!-- c3:11 -->
                <div style="order:11;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <select id="design_style3" name="design_style3" ng-model="design_style3" width="250" maxlength="80" force-model-update>
                                <option selected></option>
                                <option>Bungalow</option>
                                <option>Bungalow Raised</option>
                                <option>Bi-Level</option>
                                <option>Loft</option>
                                <option>1 Storey</option>
                                <option>1 1/2 Storey</option>
                                <option>2 Storey</option>
                                <option>2 1/2 Storey</option>
                                <option>3 Storey</option>
                                <option>Backsplit 3</option>
                                <option>Backsplit 4</option>
                                <option>Backsplit 5</option>
                                <option>Backsplit-All</option>
                                <option>Sidesplit 3</option>
                                <option>Slidesplit 4</option>
                                <option>Sidesplit 5</option>
                                <option>Slidesplit-All</option>
                                <option>Frontsplit</option>
                                <option>Multi-split</option>
                                <option>N/A</option>
                                <option>Other</option>                               
                            </select>                               
                        </div>
                    </div>
                </div>
                <!-- c3:12 -->
                <div style="order:12;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">                   
                            <input type="text" id="age3" name="age3" ng-model="age3"  force-model-update>   
                        </div>
                        <div class="input-text">                                  
                            <input type="text" id="condition3" name="condition3" ng-model="condition3"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:13 -->
                <div style="order:13;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">                            
                            <input type="text" id="floor_area3" name="floor_area3" ng-model="floor_area3"  force-model-update>                                 
                        </div>
                        <div class="input-text">
                            <select id="live_floor_area_type_cp3" name="live_floor_area_type_cp3" ng-model="live_floor_area_type_cp3" force-model-update>
                                <option>SQFT</option>
                                <option>SQM</option>    
                            </select>
                        </div>
                    </div>     
                </div>
                <!-- c3:14 -->
                <div style="order:14;" class="Rtable-cell comparable3">
                    <div class="labels-group">
                        <label>Total</label>
                        <label>Bdrms</label>                                       
                    </div>
                </div>
                <!-- c3:15 -->
                <div style="order:15;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="total3" name="total3" ng-model="total3"  force-model-update>   
                        </div>
                        <div class="input-text">
                            <input type="text" id="bdrms3" name="bdrms3" ng-model="bdrms3"  force-model-update>   
                        </div>
                    </div>
                </div>
                <!-- c3:16 -->
                <div style="order:16;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="baths3" name="baths3" ng-model="baths3"  force-model-update> 

                            <input type="button" id="bathroom_count_button_cp3" name="bathroom_count_button_cp3" ng-model="bathroom_count_button_cp3"  force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:17 -->
                <div style="order:17;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <select id="basement3" name="basement3" ng-model="basement3" width="250" maxlength="80" force-model-update>
                                <option selected></option>
                                <option>Full Finished</option>
                                <option>Part. Finished</option>
                                <option>Part. Bsmt</option>
                                <option>Finished W/O</option>
                                <option>Unfinished</option>
                                <option>Apartment</option>
                                <option>Half</option>
                                <option>Crawl Space</option>
                                <option>W/O</option>
                                <option>N/A</option>
                                <option>Other</option>                               
                            </select>             
                        </div>
                    </div>   
                </div>
                <!-- c3:18 -->
                <div style="order:18;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="parking3" name="parking3" ng-model="parking3"  force-model-update>     
                            <input type="button" id="parking_button_cp3" name="parking_button_cp3" ng-model="parking_button_cp3"  value="V" force-model-update>
                        </div>
                    </div>
                </div>
                <!-- c3:19 -->
                <div style="order:19;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="driveway_3" name="driveway_3" ng-model="driveway_3"  force-model-update> 
                        </div>
                    </div>
                </div>
                <!-- c3:20 -->
                <div style="order:20;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="extra4" name="extra4" ng-model="extra4"  force-model-update>     
                        </div>
                    </div>
                </div>
                <!-- c3:21 -->
                <div style="order:21;" class="Rtable-cell comparable3">
                    <div class="form-row">
                        <div class="input-text">
                            <input type="text" id="extra8" name="extra8" ng-model="extra8"  force-model-update>    
                        </div>
                    </div>
                </div>
                <!-- <div style="order:3;" class="Rtable-cell Rtable-cell--foot"><strong>footer 3</strong></div> -->
                </div>
            </div>
            <!-- TABLES END -->

        </div>




        <!-- END OF TABLES -->

        



        <div class="form-row">   
            <textarea id="conclusion_reconcile1" name="conclusion_reconcile1" ng-model="conclusion_reconcile1" placeholder="CONCLUSIONS/RECONCILIATION:" rows="5" cols="120"></textarea>
        </div>      

        <div class="form-row">                                                         
            <label>Has the subject property been sold more than once in the past three years?</label>  
            <div class="input-binary">   
                <label><input class="inputStyleRadio" type="radio"  name="prop_twoyears" id="prop_twoyears" ng-model="prop_twoyears" value="Yes" force-model-update>Yes</label>
            </div>
            <div class="input-binary">   
                <label><input class="inputStyleRadio" type="radio"  name="prop_twoyears" id="prop_twoyears" ng-model="prop_twoyears" value="No" force-model-update>No</label>
            </div>
        </div>  

        <div class="form-row">  
            <textarea id="summary_value_trends1" name="summary_value_trends1" ng-model="summary_value_trends1" placeholder="SALES HISTORY -- ANALYSIS OF KNOWN CURRENT AGREEMENTS FOR SALE, PRIOR SALES, OPTIONS, LISTINGS OR MARKETING OF THE SUBJECT: (minimum of three years)" rows="5" cols="110"  style="width: 100%; line-height: 20px; margin-left:0px;"></textarea>
        </div>   

        <div class="form-row">   
            <label>Comment on Reasonable Exposure Time:</label>
            <div class="inputs-group">  
                <div class="input-binary">  
                    <label><input class="inputStyleRadio" type="radio"  name=exp_time id="exp_time" ng-model="exp_time" value="Good" force-model-update>Less than 90 days</label>
                </div>
                <div class="input-binary">
                    <label><input class="inputStyleRadio" type="radio"  name="exp_time" id="exp_time" ng-model="exp_time" value="Average" force-model-update>Greater than 90 days</label>
                </div>
            </div>
            <div class="inputs-group">    
                <div class="input-binary">
                    <label><input class="inputStyleRadio" type="radio"  name="exp_time" id="exp_time" ng-model="exp_time" value="Fair" force-model-update>Greater than 120 days</label>
                </div>
                <div class="input-binary">
                    <label><input class="inputStyleRadio" type="radio"  name="exp_time" id="exp_time" ng-model="exp_time" value="Poor" force-model-update>Greater than 365 days</label>
                </div>
            </div>
        </div>

        <div class="form-row">   
            <textarea id="reasonable_exposure_time1" name="reasonable_exposure_time1" ng-model="reasonable_exposure_time1" placeholder="COMMENTS:" rows="4" cols="120"></textarea>
        </div>
    
    </div>

</fieldset>

<c:if test="${(isFullView == 'Y')}">
    <p>&nbsp;</p>
</c:if>