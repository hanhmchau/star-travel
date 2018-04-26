<%@taglib prefix="s" uri="/struts-tags" %>

<div class="col-lg-4 col-sm-6 col-xs-12">
    <div class="thumbnail deals packagesPage">
        <div style="height: 190px; overflow: hidden;">
            <img src="<s:url value="%{images[0]}"/>">
        </div>
        <a target="_blank" href="<s:url value="/tour/%{titleUrl}" />" class="pageLink"></a>
        <div class="discountInfo">
            <select class="tour-rating" data-value="<s:property value="averageRating" />">
                <s:iterator status="i" begin="1" end="5">
                    <option <s:if test="%{averageRating == #i.count}">selected="selected"</s:if> value="<s:property value="%{#i.count}" />" >
                        <s:property value="%{#i.count}" />
                    </option>
                </s:iterator>
            </select>
            <ul class="list-inline duration">
                <li>${numberOfDays} <s:if test="numberOfDays > 1">days</s:if><s:else>day</s:else></li>
                <li>${numberOfNights} <s:if test="numberOfNights > 1">nights</s:if><s:else>night</s:else></li>
            </ul>
        </div>
        <div class="caption" style="height: 310px;">
            <div style="height: 80px; text-overflow: ellipsis">
                <h4><a href="<s:url value="/tour/%{titleUrl}" />" class="captionTitle">${title}</a></h4>
            </div>
            <div style="whitespace: nowrap; height: 80px; margin-bottom: 40px;
                                         overflow: hidden; text-overflow: ellipsis;">
                <s:property value="description" escapeHtml="false"></s:property>
            </div>
            <div class="detailsInfo">
                <h5>
                    <span>Start From</span>
                    $<s:property value="getText('{0,number,#,##0.00}',{adultPrice})" />
                </h5>
                <ul class="list-inline detailsBtn">
                    <a target="_blank" href="/tour/${titleUrl}" class="btn buttonTransparent">Details</a>
                </ul>
            </div>
        </div>
    </div>
</div>
