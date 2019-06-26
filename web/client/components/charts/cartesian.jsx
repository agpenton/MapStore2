 /*
  * Copyright 2017, GeoSolutions Sas.
  * All rights reserved.
  *
  * This source code is licensed under the BSD-style license found in the
  * LICENSE file in the root directory of this source tree.
  */


import React from 'react';
import { XAxis, YAxis, CartesianGrid} from 'recharts';

import ObliqueLabel from './ObliqueLabel';

const renderCartesianTools = ({xAxis, yAxis, cartesian, xAxisAngle = 0, onUpdateLabelLength = () => {}} = {}) => ([
    xAxis && xAxis.show !== false ? <XAxis
        key="xaxis"
        {...xAxis}
        interval={xAxisAngle > 0 ? 0 : undefined}
        tick={xAxisAngle > 0 ? <ObliqueLabel angle={xAxisAngle} onUpdateLabelLength={onUpdateLabelLength}/> : undefined}
        /> : null,
    yAxis ? <YAxis key="yaxis" {...yAxis}/> : null,
    cartesian !== false ? <CartesianGrid key="cartesiangrid" {...cartesian}/> : null] );

export default renderCartesianTools;
