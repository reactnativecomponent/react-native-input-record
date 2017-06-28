import React, {Component, PropTypes} from 'react';
import {View, requireNativeComponent,NativeModules} from 'react-native';
const { RNInputRecord } = NativeModules;

export default RNInputRecord;
export class RCTTimerTip extends Component {

    render() {
        return (
            <TimerTip
                {...this.props}
            />);
    }
}
RCTTimerTip.propTypes = {
    ...View.propTypes,
    level:PropTypes.string,
    time:PropTypes.string,
    numFontSize:PropTypes.string,
    status:PropTypes.string,
};
const TimerTip = requireNativeComponent('TimerTip', RCTTimerTip);

export class RCTRecordView extends Component {

    _onchange = (event) => {
        if (this.props.onChange && event.nativeEvent) {
            this.props.onChange(event.nativeEvent);
        }
    }

    render() {
        return (
            <RecordView
                {...this.props}
                onChange={this._onchange}
            />);
    }
}
RCTRecordView.propTypes = {
    ...View.propTypes,
    textArr: PropTypes.arrayOf(PropTypes.string),
    onChange: PropTypes.func,
    fontSize: PropTypes.string,
};
const RecordView = requireNativeComponent('RecordView', RCTRecordView);