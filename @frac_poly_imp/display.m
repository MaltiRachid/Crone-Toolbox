%DISPLAY Display array.
%   DISPLAY(X) is called for the object X when the semicolon is not used
%   to terminate a statement. 
%
%   For example,
%     X = datetime(2014,1:5,1)
%   calls DISPLAY(X) while
%     X = datetime(2014,1:5,1);
%   does not.
%
%   A typical implementation of DISPLAY calls DISP to do most of the work.
%   To customize the display of objects, overload the DISP function.
%   Note that DISP does not display empty arrays.
%   
%   See also disp, formattedDisplayText, matlab.mixin.CustomDisplay.
%%   Documentation for display
%      doc display
%%   Other functions named display
%%      AnalysisPoint/display     instrument/display
%      cdfepoch/display          iviconfigurationstore/display
%      cgfuncmodel/display       laurmat/display
%      codistributed/display     laurpoly/display
%      conbase/display           loopswitch/display
%      coninputfactor/display    mbcinputfactor/display
%      customreg/display         mechss/display
%      cvdata/display            mpc/display
%      cvtest/display            mpcstate/display
%      distributed/display       network/display
%      fints/display             opaque/display
%      frac_idtf/display         opcroot/display
%      frac_lti/display          phytree/display
%      frac_poly_exp/display     pid/display
%      frac_poly_imp/display     pidstd/display
%      frac_ss/display           pidstd2/display
%      frac_tf/display           serial/display
%      frac_zpk/display          sfit/display
%      frd/display               SimData/display
%      genfrd/display            SimTimeseries/display
%      genmat/display            slLinearizer/display
%      genss/display             slTuner/display
%      gmdistribution/display    sparss/display
%      gpuArray/display          ss/display
%      groupedData/display       sym/display
%      icgroup/display           symmatrix/display
%      icsignal/display          tabular/display
%      idarx/display             tall/display
%      iddata/display            tf/display
%      idfrd/display             timeseries/display
%      idgrey/display            tscollection/display
%      idnlgrey/display          udyn/display
%      idnlhw/display            ufrd/display
%      idpoly/display            umat/display
%      idproc/display            uss/display
%      idss/display              vrfigure/display
%      idtf/display              vrnode/display
%      imaqchild/display         vrworld/display
%      imaqdevice/display        wtbo/display
%      inline/display            zpk/display
%