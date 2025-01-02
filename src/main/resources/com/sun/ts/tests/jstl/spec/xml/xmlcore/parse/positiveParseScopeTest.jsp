<%--

    Copyright (c) 2003, 2018 Oracle and/or its affiliates. All rights reserved.

    This program and the accompanying materials are made available under the
    terms of the Eclipse Public License v. 2.0, which is available at
    http://www.eclipse.org/legal/epl-2.0.

    This Source Code may also be made available under the following Secondary
    Licenses when the conditions for such availability set forth in the
    Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
    version 2 with the GNU Classpath Exception, which is available at
    https://www.gnu.org/software/classpath/license.html.

    SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0

--%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="x" uri="jakarta.tags.xml" %>

<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<tck:test testName="positiveParseScopeTest">

   <!-- The scope attribute specifies the scope into which
             var is exported.  If not specified, var is exported
             to the page scope by default. -->
   <x:parse doc="<test>xmltext</test>" var="riPageText"/>
   <x:parse doc="<test>xmltext</test>" var="rePageText" scope="page"/>
   <x:parse doc="<test>xmltext</test>" var="reRequestText" scope="request"/>
   <x:parse doc="<test>xmltext</test>" var="reSessionText" scope="session"/>
   <x:parse doc="<test>xmltext</test>" var="reApplicationText" scope="application"/>
   <tck:checkScope varName="riPageText"/>
   <tck:checkScope varName="rePageText"/>
   <tck:checkScope varName="reRequestText" inScope="request"/>
   <tck:checkScope varName="reSessionText" inScope="session"/>  
   <tck:checkScope varName="reApplicationText" inScope="application"/>
   <c:remove var="reApplicationText" scope="application"/> 
</tck:test>
