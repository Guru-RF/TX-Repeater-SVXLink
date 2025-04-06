namespace eval Logic {

variable is_rf 0;

proc squelch_open {rx_id is_open} {
        variable sql_rx_id;
        variable is_rf;
        set sql_rx_id $rx_id;
        if {!$is_open} {
                set is_rf 1;
        }
}

proc send_rgr_sound {} {
        variable is_rf;
        if {!$is_rf} {
                # Signal was received from network
                playTone 525 100 50;
                playSilence 100
        } else {
                # Signal received from local
                playTone 1633 100 50;
                playSilence 80;
                playTone 1209 100 50;
        }
        set is_rf 0;
        }
}
# end of namespace
