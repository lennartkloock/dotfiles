function work -a week_diff --description 'show work in week starting on tuesday'
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
end
