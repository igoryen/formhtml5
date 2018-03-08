

<fieldset ng-disabled="isAppraiserSigned()" check-if-required>

    <legend ng-click="toggleElement('neighbourhood', $event)">&nbsp;-&nbsp;NEIGHBOURHOOD</legend>
    <div id="neighbourhood" class="reportSection" ng-hide="oToggleElementList['neighbourhood']">

        <div class="report-section-columns-group">

            <!-- COLUMN 1 -->
            <div id="column1" class="reportSection report-section-column">

                <div class="form-row"> 
                    <label>NATURE OF DISTRICT: </label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="checkbox" name="NatureOfDistrict_Residential" id="NatureOfDistrict_Residential" ng-model="NatureOfDistrict_Residential" value="Residential" force-model-update>Residential</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="NatureOfDistrict_Rural" id="NatureOfDistrict_Rural" ng-model="NatureOfDistrict_Rural" value="Rural" force-model-update>Rural</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="requested_by_02" id="NatureOfDistrict_Commercial" ng-model="NatureOfDistrict_Commercial" value="Commercial" force-model-update>Commercial</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="requested_by_01" id="NatureOfDistrict_Industrial" ng-model="NatureOfDistrict_Industrial" value="Industrial" force-model-update>Industrial</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="checkbox" name="NatureOfDistrict_Other" id="NatureOfDistrict_Other" ng-model="NatureOfDistrict_Other" value="Other" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="NatureOfDistrict_Other_Desc" name="NatureOfDistrict_Other_Desc" ng-model="NatureOfDistrict_Other_Desc" width="250" maxlength="80" force-model-update>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <label>TREND OF DISTRICT:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="trend_of_district" id="trend_of_district" ng-model="trend_of_district" value="Improving" force-model-update>Improving</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="trend_of_district" id="trend_of_district" ng-model="trend_of_district" value="Stable" force-model-update>Stable</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="trend_of_district" id="trend_of_district" ng-model="trend_of_district" value="Transition" force-model-update>Transition</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="trend_of_district" id="trend_of_district" ng-model="trend_of_district" value="Deteriorating" force-model-update>Deteriorating</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="radio"  name="trend_of_district" id="trend_of_district" ng-model="trend_of_district" value="Other" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="trend_district_other" name="trend_district_other" ng-model="trend_district_other" width="250" maxlength="80" force-model-update></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <label>BUILT-UP:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="built_up" id="built_up" ng-model="built_up" value="Over 75%" force-model-update>Over 75%</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="built_up" id="built_up" ng-model="built_up" value="25-75%" force-model-update>25-75%</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="built_up" id="built_up" ng-model="built_up" value="Under 25%" force-model-update>Under 25%</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="radio"  name="built_up" id="built_up" ng-model="built_up" value="Other" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="built_up_other" name="built_up_other" ng-model="built_up_other" width="250" maxlength="80" force-model-update></label>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-row"> 
                    <label>CONFORMITY<span class="capitalized">&nbsp;Age:</span></label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="confirmity_age" id="confirmity_age" ng-model="confirmity_age" value="Newer" force-model-update>Newer</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="confirmity_age" id="confirmity_age" ng-model="confirmity_age" value="Similar" force-model-update>Similar</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="confirmity_age" id="confirmity_age" ng-model="confirmity_age" value="Older" force-model-update>Older</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="radio"  name="confirmity_age" id="confirmity_age" ng-model="confirmity_age" value="Other" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="confirmity_age_other" name="confirmity_age_other" ng-model="confirmity_age_other" width="250" maxlength="80" force-model-update></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <label class="capitalized">Condition:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="condition" id="condition" ng-model="condition" value="Superior" force-model-update>Superior</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="condition" id="condition" ng-model="condition" value="Similar" force-model-update>Similar</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="condition" id="condition" ng-model="condition" value="Inferior" force-model-update>Inferior</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="radio"  name="condition" id="condition" ng-model="condition" value="Other" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="condition_other" name="condition_other" ng-model="condition_other" width="250" maxlength="80" force-model-update></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <label class="capitalized">Size:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="size" id="size" ng-model="size" value="Larger" force-model-update>Larger</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="size" id="size" ng-model="size" value="Similar" force-model-update>Similar</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="size" id="size" ng-model="size" value="Inferior" force-model-update>Inferior</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="radio"  name="size" id="size" ng-model="size" value="Other" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="size_other" name="size_other" ng-model="size_other" width="250" maxlength="80" force-model-update></label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- END OF COLUMN 1 -->
            <!-- COLUMN 2 -->

            <div id="column2" class="reportSection report-section-column">

                <div class="form-row"> 
                    <div class="input-text">
                        <label>AGE RANGE OF PROPERTIES:</label>
                        <input type="text" id="age_range_property" name="age_range_property" ng-model="age_range_property" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text">
                        <label>to</label> 
                        <input type="text" id="age_range_property2" name="age_range_property2" ng-model="age_range_property2" width="250" maxlength="80" force-model-update>
                        <label>years(+-)</label>
                    </div>
                </div>

                <div class="rowsOfInputsGroup-container">
                    <label>MARKET OVERVIEW</label>
                    <div class="rowsOfInputsGroup">

                        <div class="inputs-row">
                            <label>Supply:</label>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Good"      force-model-update>Good</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Average"   force-model-update>Average</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Fair"      force-model-update>Fair</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Poor"      force-model-update>Poor</label>
                            </div>

                        </div>
                        <div class="inputs-row">
                            <label>Demand:</label>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Good"      force-model-update>Good</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Average"   force-model-update>Average</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Fair"      force-model-update>Fair</label>
                            </div>
                            <div class="input-binary">
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Poor"      force-model-update>Poor</label>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- <div class="rowsOfInputsGroup-container">
                    <label>MARKET OVERVIEW</label>
                    <div class="rowsOfInputsGroup">
                        <div class="inputs-row">
                            <label>Supply:</label>
                            <div class="inputs-grouped">
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Good"      force-model-update>Good</label>
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Average"   force-model-update>Average</label>
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Fair"      force-model-update>Fair</label>
                                <label><input type="radio"  name="market_supply" id="market_supply" ng-model="market_supply" value="Poor"      force-model-update>Poor</label>
                            </div>
                        </div>
                        <div class="inputs-row">
                            <label>Demand:</label>
                            <div class="inputsGrouped">
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Good"      force-model-update>Good</label>
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Average"   force-model-update>Average</label>
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Fair"      force-model-update>Fair</label>
                                <label><input type="radio"  name="market_demand" id="market_demand" ng-model="market_demand" value="Poor"      force-model-update>Poor</label>
                            </div>
                        </div>
                    </div>
                </div> -->
                <div class="form-row"> 
                    <label>PRICE TRENDS:</label>
                    <div class="input-binary">

                        <label><input type="checkbox" name="PriceTrend_Increasing" id="PriceTrend_Increasing" ng-model="PriceTrend_Increasing" value="Increasing" force-model-update>Increasing</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="checkbox" name="PriceTrend_Stable" id="PriceTrend_Stable" ng-model="PriceTrend_Stable" value="Stable" force-model-update>Stable</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="checkbox" name="PriceTrend_Declining" id="PriceTrend_Declining" ng-model="PriceTrend_Declining" value="Declining" force-model-update>Declining</label>
                    </div>
                </div>
                <div class="form-row"> 
                    <label>PRICE RANGE OF PROPERTIES:</label>
                    <div class="input-text money">
                        <label>$</label>
                        <input type="text" id="price_range_from" name="price_range_from" ng-model="price_range_from" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text money">
                        <label>to $</label>
                        <input type="text" id="price_range_to" name="price_range_to" ng-model="price_range_to" width="250" maxlength="80" force-model-update>
                    </div>
                </div>
                <div class="form-row"> 
                    <label>ADVERSE INFLUENCES:</label>
                    <div class="input-binary">
                        <label><input type="radio"  name="adverse_influence" id="adverse_influence" ng-model="adverse_influence" value="Yes" force-model-update>Yes</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="radio"  name="adverse_influence" id="adverse_influence" ng-model="adverse_influence" value="No" force-model-update>No</label>
                    </div>
                </div>
            </div>
            <!-- END OF COLUMN 2 -->


        </div>
        <textarea id="summary_value_trends1" placeholder="SUMMARY: INCLUDES VALUE TRENDS, MARKET APPEAL, APPARENT ADVERSE INFLUENCES IN THE AREA, IF ANY(e.g. railroad tracks, unkempt properties, major traffic arteries, Hydro facilities,  anticipated public or private improvements, commercial/industrial sites, landfill sites, etc."
                      rows="5" cols="110"></textarea>


        <div class="form-row"> 
            <label>Please provide an accurate rating of the neighbourhood:</label>
            <div class="inputs-group">
                <div class="input-binary">
                    <label><input type="radio"  name="nrating" id="nrating" ng-model="nrating" value="Excellent"   force-model-update>Excellent</label>
                </div>
                <div class="input-binary">
                    <label><input type="radio"  name="nrating" id="nrating" ng-model="nrating" value="Good"        force-model-update>Good</label>
                </div>
                <div class="input-binary">
                    <label><input type="radio"  name="nrating" id="nrating" ng-model="nrating" value="Average"     force-model-update>Average</label>
                </div>
                <div class="input-binary">
                    <label><input type="radio"  name="nrating" id="nrating" ng-model="nrating" value="Fair"        force-model-update>Fair</label>
                </div>
                <div class="input-binary">
                    <label><input type="radio"  name="nrating" id="nrating" ng-model="nrating" value="Poor"        force-model-update>Poor</label>
                </div>
            </div>
        </div>
    </div>
</fieldset>
<!-- SITE AND IMPROVEMENTS -->

<fieldset ng-disabled="isAppraiserSigned()" check-if-required>
    <legend ng-click="toggleElement('site_improvements', $event)">&nbsp;-&nbsp;SITE AND IMPROVEMENTS</legend>
    <div id="site" class="reportSection" ng-hide="oToggleElementList['site_improvements']">
        <div class="report-section-columns-group">

            <!-- COLUMN 1 -->
            <div class="report-section-column">

                <div class="form-row">
                    <div class="input-text">
                        <label>SITE DIMENSIONS:</label>
                        <input type="text" id="site_dims" name="site_dims" class="length-units" ng-model="site_dims" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="input-text">
                        <label>X</label>
                        <input type="text" id="site_dims2" name="site_dims2" class="length-units" ng-model="site_dims2" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio"  name="site_dim_measure" id="site_dim_measure" ng-model="site_dim_measure" value="1" force-model-update>Ft. </label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="site_dim_measure" id="site_dim_measure" ng-model="site_dim_measure" value="2" force-model-update>M.</label>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <div class="input-text">
                        <label>SITE AREA:</label>
                        <input type="text"  name="site_area"         id="site_area" ng-model="site_area" width="250" maxlength="80" force-model-update>
                    </div>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio" name="site_area_measure" id="site_area_measure" ng-model="site_area_measure" value="1" force-model-update>SQFT</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="site_area_measure" id="site_area_measure" ng-model="site_area_measure" value="2" force-model-update>SQM</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="site_area_measure" id="site_area_measure" ng-model="site_area_measure" value="3" force-model-update>ACRE</label>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <div class="input-text">
                        <label>SOURCE:</label>
                        <input type="text" id="source" name="source" ng-model="source" width="250" maxlength="80" force-model-update>
                    </div>
                </div>

                <div class="form-row"> 
                    <div class="input-text">
                        <label>TOPOGRAPHY:</label>
                        <input type="text" id="topography1" name="topography1" ng-model="topography1" width="250" maxlength="80" force-model-update>
                    </div>
                </div>

                <div class="form-row"> 
                    <div class="input-text">
                        <label>CONFIGURATION:</label>
                        <input type="text" id="configuration1" name="configuration1" ng-model="configuration1" width="250" maxlength="80" force-model-update>
                    </div>
                </div>
                <div class="form-row"> 
                    <div class="input-text">
                        <label> ZONING:</label>
                        <select type="text" id="zoning1" name="zoning1" ng-model="zoning1" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Residential</option>
                            <option>Commercial</option>
                            <option>Industrial</option>
                            <option>Agricultural</option>
                            <option>Mix</option>
                            <option>High Density Residential</option>
                           <option>Other - see comments</option>
                        </select> 
                    </div>
                </div>
                <div class="form-row"> 
                    <label>DOES EXISTING USE CONFORM TO CURRENT ZONING?</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio" name="existing_use_zoning" id="existing_use_zoning" ng-model="existing_use_zoning" value="Yes" force-model-update>Yes</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="existing_use_zoning" id="existing_use_zoning" ng-model="existing_use_zoning" value="No" force-model-update>No</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio"  name="existing_use_zoning" id="existing_use_zoning" ng-model="existing_use_zoning" value="Unknown" force-model-update>Unknown</label>
                        </div>
                    </div>
                </div>


                <div class="form-row"> 
                    <label>EASEMENTS:</label>
                    <div class="input-binary">
                        <label><input type="checkbox" name="easements_utility" id="easements_utility" ng-model="easements_utility" value="Utility" force-model-update>Utility</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="checkbox" name="easements_access" id="easements_access" ng-model="easements_access" value="Access" force-model-update>Access</label>
                    </div>
                    <div class="input-binary">
                        <label><input type="checkbox" name="easements_other" id="easements_other" ng-model="easements_other" value="Other" force-model-update>Other</label>
                    </div>
                </div>
            </div>
            <!-- END OF COLUMN 1 -->

            <!-- COLUMN 2 --> 

            <div class="report-section-column">

                <div class="form-row">
                    <label>UTILITES:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_telephone"       id="utility_telephone"       ng-model="utility_telephone"       value="utility_telephone"       force-model-update>Telephone</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_sewer"           id="utility_sewer"           ng-model="utility_sewer"           value="utility_sewer"           force-model-update>Utility Sewer</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_septic_system"   id="utility_septic_system"   ng-model="utility_septic_system"   value="utility_septic_system"   force-model-update>Septic System</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_municipal_water" id="utility_municipal_water" ng-model="utility_municipal_water" value="utility_municipal_water" force-model-update>Municipal Water</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_well"            id="utility_well"            ng-model="utility_well"            value="utility_well"            force-model-update>Well</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_gas"             id="utility_gas"             ng-model="utility_gas"             value="utility_gas"             force-model-update>Natural Gas</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_storm_sewer"     id="utility_storm_sewer"     ng-model="utility_storm_sewer"     value="utility_storm_sewer"     force-model-update>Storm Sewer</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="utility_ditch"           id="utility_ditch"           ng-model="utility_ditch"           value="utility_ditch"           force-model-update>Open Ditch</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="checkbox" name="util_other"              id="util_other"              ng-model="util_other"              value="utility_other"           force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input        type="text"     name="utilities_other"         id="utilities_other"         ng-model="utilities_other" width="250" maxlength="80"       force-model-update></label>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <label>FEATURES:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_paved_road"  id="features_paved_road"  ng-model="features_paved_road"  value="features_paved_road"  force-model-update>Paved Road</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_sidewalk"    id="features_sidewalk"    ng-model="features_sidewalk"    value="features_sidewalk"    force-model-update>Sidewalk</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_lights"      id="features_lights"      ng-model="features_lights"      value="features_lights"      force-model-update>Street Lights</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_road"        id="features_road"        ng-model="features_road"        value="features_road"        force-model-update>Gravel Road</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_curbs"       id="features_curbs"       ng-model="features_curbs"       value="features_curbs"       force-model-update>Curbs</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_cablevision" id="features_cablevision" ng-model="features_cablevision" value="features_cablevision" force-model-update>Cablevision</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="features_lane"        id="features_lane"        ng-model="features_lane"        value="features_lane"        force-model-update>Lane</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="checkbox" name="feature_other"        id="feature_other"        ng-model="feature_other"        value="feature_other"        force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input        type="text"     name="features_other"       id="features_other"       ng-model="features_other"  class="other-short" width="250" maxlength="80"   force-model-update>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <label>ELECTRICAL:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio" name="electrical" id="electrical" ng-model="electrical" value="Underground" force-model-update>Underground</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="electrical" id="electrical" ng-model="electrical" value="Overhead" force-model-update>Overhead</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="electrical" id="electrical" ng-model="electrical" value="Other" force-model-update>Other</label>
                        </div>
                    </div>
                </div>


                <!-- driveway  -->

                <div class="form-row">
                    <label>DRIVEWAY:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="checkbox" name="private_driveway" id="private_driveway" ng-model="private_driveway" value="private_driveway" force-model-update>Private</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="mutual_driveway" id="mutual_driveway" ng-model="mutual_driveway" value="mutual_driveway" force-model-update>Mutual</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="none_driveway" id="none_driveway" ng-model="none_driveway" value="none_driveway" force-model-update>None</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="single_driveway" id="single_driveway" ng-model="single_driveway" value="single_driveway" force-model-update>Single</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="double_driveway" id="double_driveway" ng-model="double_driveway" value="double_driveway" force-model-update>Double</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="checkbox" name="other_driveway" id="other_driveway" ng-model="other_driveway" value="other_driveway" force-model-update>Other (Access)</label>
                            </div>
                            <div class="input-text">
                                <input        type="text"     name="driveway_describe" id="driveway_describe"  ng-model="driveway_describe" class="other-short" width="250" maxlength="80" force-model-update>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <label>SURFACE:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="checkbox" name="concrete_surface" id="concrete_surface" ng-model="concrete_surface" value="concrete_surface"   force-model-update>Concrete</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="asphalt_surface"  id="asphalt_surface"  ng-model="asphalt_surface"  value="asphalt_surface"    force-model-update>Asphalt</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="stone_surface"    id="stone_surface"    ng-model="stone_surface"    value="stone_surface"      force-model-update>Stone</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="gravel_surface"   id="gravel_surface"   ng-model="gravel_surface"   value="gravel_surface"     force-model-update>Gravel</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="brick_surface"    id="brick_surface"    ng-model="brick_surface"    value="brick_surface"      force-model-update>Brick</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="checkbox" name="other_surface"    id="other_surface"    ng-model="other_surface"    value="other_surface"      force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input        type="text"     name="surface_describe" id="surface_describe" ng-model="surface_describe" class="other-short" width="250" maxlength="80" force-model-update>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- driveway -->


                <div class="form-row"> 
                    <label>PARKING:</label>
                    <div class="inputs-group"> 
                        <div class="input-binary">
                            <label><input type="checkbox" name="garage_parking" id="garage_parking" ng-model="garage_parking" value="garage_parking" force-model-update>Garage</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="carport_parking" id="carport_parking" ng-model="carport_parking" value="carport_parking" force-model-update>Carport</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="driveway_parking" id="driveway_parking" ng-model="driveway_parking" value="driveway_parking" force-model-update>Driveway</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="checkbox" name="street_parking" id="street_parking" ng-model="street_parking" value="street_parking" force-model-update>Street</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="checkbox" name="other_parking" id="other_parking" ng-model="other_parking" value="other_parking" force-model-update>Other</label>
                            </div>
                            <div class="input-text">
                                <input type="text" id="parking_describe" name="parking_describe" ng-model="parking_describe" width="250" maxlength="80" force-model-update>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-row"> 
                    <label>LANDSCAPING:</label>
                    <div class="inputs-group">
                        <div class="input-binary"> 
                            <label><input type="radio" name="landscaping"          id="landscaping"          ng-model="landscaping" value="Good" force-model-update>Good</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="landscaping"          id="landscaping"          ng-model="landscaping" value="Average" force-model-update>Average</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="landscaping"          id="landscaping"          ng-model="landscaping" value="Fair" force-model-update>Fair</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="landscaping"          id="landscaping"          ng-model="landscaping" value="Poor" force-model-update>Poor</label>
                        </div>
                        <div>
                            <div class="input-binary">
                                <label><input type="radio" name="landscaping"          id="landscaping"          ng-model="landscaping" value="N/A" force-model-update>N/A, See Comments</label>
                            </div>
                            <div class="input-text">
                                <input type="text"  name="landscaping_describe" id="landscaping_describe" ng-model="landscaping_describe" class="other-short" width="250" maxlength="80" force-model-update>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-row"> 
                    <label>CURB APPEAL:</label>
                    <div class="inputs-group">
                        <div class="input-binary"> 
                            <label><input type="radio" name="curb_appeal"          id="curb_appeal"           ng-model="curb_appeal" value="Good" force-model-update>Good</label>
                        </div>
                        <div class="input-binary"> 
                            <label><input type="radio" name="curb_appeal"          id="curb_appeal"           ng-model="curb_appeal" value="Average" force-model-update>Average</label>
                        </div>
                        <div class="input-binary"> 
                            <label><input type="radio" name="curb_appeal"          id="curb_appeal"           ng-model="curb_appeal" value="Fair" force-model-update>Fair</label>
                        </div>
                        <div>
                            <div class="input-binary"> 
                                <label><input type="radio" name="curb_appeal"          id="curb_appeal"           ng-model="curb_appeal" value="Poor" force-model-update>Poor</label>
                            </div>
                            <div class="input-text"> 
                                <input type="text"  name="curb_appeal_describe" id="curb_appeal_describe"  ng-model="curb_appeal_describe" width="250" maxlength="80" force-model-update>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END OF COLUMN 2 -->
        </div>
        <!-- end of report-section-columns-group -->

        <div class="form-row">
            <textarea id="site_comments1" name="site_comments1" ng-model="site_comments1" class="first" placeholder="COMMENTS:" rows="5" cols="110"></textarea>
        </div>

        <div class="form-row">
            <div class="input-text"> 
                <label>ESTIMATED AGE OF SUBJECT (YEAR BUILT):</label>
                <input type="text" id="estimated_subj_age" name="estimated_subj_age" ng-model="estimated_subj_age" width="250" maxlength="80" force-model-update>
                <label class="lower-case">years</label>
            </div>
            <div class="input-text"> 
                <label>EFFECTIVE AGE:</label>
                <input type="text" id="effective_subj_age" name="effective_subj_age" ng-model="effective_subj_age" width="250" maxlength="80" force-model-update>
                <label class="lower-case">Years</label>
            </div>
            <div class="input-text"> 
                <label>Remaining economic life (estimated):</label>
                <input type="text" id="remaining_econ_life" name="remaining_econ_life" ng-model="remaining_econ_life" width="250" maxlength="80" force-model-update>
                <label class="lower-case">years</label>
            </div>
        </div>
        <div class="form-row">
            <label>OVERALL EXTERIOR CONDITION:</label>
            <div class="input-binary">
                <label><input type="radio" name="exterior_condition" id="exterior_condition" ng-model="exterior_condition" value="Good"    force-model-update>Good</label>
            </div>
            <div class="input-binary">
                <label><input type="radio" name="exterior_condition" id="exterior_condition" ng-model="exterior_condition" value="Average" force-model-update>Average</label>

            </div> 
            <div class="input-binary">
                <label><input type="radio" name="exterior_condition" id="exterior_condition" ng-model="exterior_condition" value="Fair"    force-model-update>Fair</label>

            </div> 
            <div class="input-binary">
                <label><input type="radio" name="exterior_condition" id="exterior_condition" ng-model="exterior_condition" value="Poor"    force-model-update>Poor</label>
            </div> 
        </div>
        <div class="report-section-columns-group">
            <!-- COLUMN 1 -->
            <div class="report-section-column">
                <div>
                    column 1
                </div>
            </div>
            <!-- end of COLUMN 1 -->
            <!-- COLUMN 2 -->
            <div class="report-section-column">
                <div class="form-row">
                    <div class="input-text">
                        <label>PROPERTY TYPE:</label>
                        <select type="text" id="property_type" name="property_type" ng-model="property_type" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Single family</option>
                            <option>Condo</option>
                            <option>Duplex</option>
                            <option>Triplex</option>
                            <option>Fourplex</option>
                            <option>Multiplex</option>
                            <option>Cottage</option>
                            <option>Acreage/Rural Residential</option>
                            <option>Vacant Land</option>
                            <option>Mobile/Trailer</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>
                <div class="form-row"> 
                    <div class="input-text">
                        <label>BUILDING TYPE:</label>
                        <select type="text" id="type_building" name="type_building" ng-model="type_building" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Apartment</option>
                            <option>Condo-Hotel</option>
                            <option>Detached</option>
                            <option>Semi-Detached</option>
                            <option>Att/Row/Townhouse</option>
                            <option>Link</option>
                            <option>N/A</option> 
                        </select>
                    </div>
                </div>

                <div class="form-row"> 
                    <div class="input-text">
                        <label>DESIGN/STYLE:</label>
                        <select type="text" id="design_style" name="design_style" ng-model="design_style" width="250" maxlength="80" force-model-update>
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
                            <option>Sidesplit 4</option>
                            <option>Sidesplit 5</option>
                            <option>Sidesplit-All</option>
                            <option>Frontsplit</option>
                            <option>Multi-split</option>
                            <option>N/A</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>


                <div class="form-row"> 
                    <div class="input-text">
                        <label>CONSTRUCTION:</label>
                        <select type="text" id="construction" name="construction" ng-model="construction" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Concrete</option>
                            <option>Brick</option>
                            <option>Stone</option>
                            <option>Wood</option>
                            <option>Unconventional Construction</option>
                            <option>N/A</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>

                <div class="form-row"> 
                    <div class="input-text">
                        <label>BASEMENT:</label>
                        <select type="text" id="basement" name="basement" ng-model="basement" value="" width="250" maxlength="80" force-model-update>
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
                <div class="form-row"> 
                    <div class="input-text">
                        <label>HEATING SYSTEM:</label>
                        <select type="text" id="heating_system" name="heating_system" ng-model="heating_system" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Forced Air</option>
                            <option>Hot Water</option>
                            <option>Baseboard</option>
                            <option>Heat Pump</option>
                            <option>Radiant</option>
                            <option>N/A</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>

                <div class="form-row"> 
                    <div class="input-text">
                        <label>FUEL TYPE:</label>
                        <select type="text" id="fuel_type" name="fuel_type" ng-model="fuel_type" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Gas</option>
                            <option>Oil</option>
                            <option>Electric</option>
                            <option>Ground Source</option>
                            <option>Propane</option>
                            <option>Solar</option>
                            <option>Wood</option>
                            <option>N/A</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- end of COLUMN 2 -->
            <!-- COLUMN 3 -->
            <div class="report-section-column">
                <div class="form-row"> 
                    <div class="input-text">
                        <label>ROOFING:</label>
                        <select type="text" id="roofing" name="roofing" ng-model="roofing" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Asphalt Shingle</option>
                            <option>Wood Shingle</option>
                            <option>Tar &amp; Gravel</option>
                            <option>Metal</option>
                            <option>Clay Title</option>
                            <option>Concrete Tile</option>
                            <option>Slate</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>

                <!-- TODO: add Angular -->
                <div class="form-row">
                    <label>CONDITION:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio" name="roofing_condition" id="roofing_condition" ng-model="roofing_condition" value="Good"    force-model-update>Good</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="roofing_condition" id="roofing_condition" ng-model="roofing_condition" value="Average" force-model-update>Average</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="roofing_condition" id="roofing_condition" ng-model="roofing_condition" value="Fair"    force-model-update>Fair</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="roofing_condition" id="roofing_condition" ng-model="roofing_condition" value="Poor"    force-model-update>Poor</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-text">
                        <label>EXTERIOR FINISH:</label>
                        <select type="text" id="exterior_finish" name="exterior_finish" ng-model="exterior_finish" width="250" maxlength="80" force-model-update>
                            <option selected></option>
                            <option>Solid Brick</option>
                            <option>Brick Veneer</option>
                            <option>Brick Front</option>
                            <option>Solid Stone</option>
                            <option>Stone Veneer</option>
                            <option>Stucco</option>
                            <option>Plaster</option>
                            <option>Wood Siding</option>
                            <option>Aluminum Siding</option>
                            <option>Vinyl Siding</option>
                            <option>Board/Batten</option>
                            <option>Metal Siding</option>
                            <option>Concrete</option>
                            <option>Shingle</option>
                            <option>Log</option>
                            <option>Insulbrick</option>
                            <option>Mix Insulbrick</option>
                            <option>Other</option>
                        </select>
                    </div>
                </div>

                <!-- TODO: add Angular -->
                <div class="form-row"> 
                    <label>CONDITION:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input type="radio" name="ext_finish_condition" id="ext_finish_condition" ng-model="ext_finish_condition" value="Good"    force-model-update>Good</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="ext_finish_condition" id="ext_finish_condition" ng-model="ext_finish_condition" value="Average" force-model-update>Average</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="ext_finish_condition" id="ext_finish_condition" ng-model="ext_finish_condition" value="Fair"    force-model-update>Fair</label>
                        </div>
                        <div class="input-binary">
                            <label><input type="radio" name="ext_finish_condition" id="ext_finish_condition" ng-model="ext_finish_condition" value="Poor"    force-model-update>Poor</label>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="input-binary">
                        <label>
                            <input type="checkbox" name="see_comments_exterior_finish" id="see_comments_exterior_finish" ng-model="see_comments_exterior_finish" value="1" force-model-update>See Comments
                        </label>
                    </div>
                </div>

                <!-- TODO: add Angular -->
                <div class="form-row">
                    <label for="asbestos">ASBESTOS:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input id="asbestos" type="radio" name="asbestos" ng-model="asbestos" value="Yes"     force-model-update>Yes</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="asbestos" type="radio" name="asbestos" ng-model="asbestos" value="No"      force-model-update>No</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="asbestos" type="radio" name="asbestos" ng-model="asbestos" value="Unknown" force-model-update>Unknown</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="asbestos" type="radio" name="asbestos" ng-model="asbestos" value="Removed" force-model-update>Removed</label>
                        </div>
                    </div>
                </div>
                <!-- TODO: add Angular -->
                <div class="form-row">
                    <label for="pyrite">PYRITE:</label>
                    <div class="inputs-group">                
                        <div class="input-binary">
                            <label><input id="pyrite" type="radio" name="pyrite" ng-model="pyrite" value="Yes"     force-model-update>Yes</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="pyrite" type="radio" name="pyrite" ng-model="pyrite" value="No"      force-model-update>No</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="pyrite" type="radio" name="pyrite" ng-model="pyrite" value="Unknown" force-model-update>Unknown</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="pyrite" type="radio" name="pyrite" ng-model="pyrite" value="Removed" force-model-update>Removed</label>
                        </div>
                    </div>
                </div>

                <!-- TODO: add Angular -->
                <div class="form-row">
                    <label for="pyrite">GROW-OP:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input id="grow-op" type="radio" name="grow-op" ng-model="grow-op" value="Yes"     force-model-update>Yes</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="grow-op" type="radio" name="grow-op" ng-model="grow-op" value="No"      force-model-update>No</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="grow-op" type="radio" name="grow-op" ng-model="grow-op" value="Unknown" force-model-update>Unknown</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="grow-op" type="radio" name="grow-op" ng-model="grow-op" value="Removed" force-model-update>Removed</label>
                        </div>
                    </div>
                </div>

                <!-- TODO: add Angular -->
                <div class="form-row">
                    <label for="uffi">UFFI:</label>
                    <div class="inputs-group">
                        <div class="input-binary">
                            <label><input id="uffi" type="radio" name="uffi" ng-model="uffi" value="Yes"     force-model-update>Yes</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="uffi" type="radio" name="uffi" ng-model="uffi" value="No"      force-model-update>No</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="uffi" type="radio" name="uffi" ng-model="uffi" value="Unknown" force-model-update>Unknown</label>
                        </div>
                        <div class="input-binary">
                            <label><input id="uffi" type="radio" name="uffi" ng-model="uffi" value="Removed" force-model-update>Removed</label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end of COLUMN 3 -->
        </div>
    </div>
</fieldset>
