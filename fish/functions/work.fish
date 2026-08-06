function work -a action week_diff --description 'work util command related to time tracking'
    if test -z $action
        set action work
    end

    if test "$action" = work
        timew start
        ssh kokuna
        timew stop
        timewsync
    else if test "$action" = show
        if test -z $week_diff
            set week_diff 0
        end

        if test (date +%u) = 4
            set start (date --date="thursday" +%s)
        else
            set start (date --date="last thursday" +%s)
        end
        set end (date --date="next thursday" +%s)

        set diff (math "$week_diff * 7 * 24 * 60 * 60")
        set start (math $start - $diff)
        set end (math $end - $diff)

        timew week (date --iso-8601=seconds --date="@$start") - (date --iso-8601=seconds --date="@$end")
    else
        echo "Unknown action: $action"
    end
end
