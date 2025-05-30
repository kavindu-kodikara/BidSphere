package com.kv.ee.core.modle;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class Validate {
    public static List<AutoBidConfig> sortBidConfigs(List<AutoBidConfig> autoBidders) {
        return autoBidders.stream()
                .sorted(Comparator
                        .comparing(AutoBidConfig::getRegisteredAt)
                        .thenComparing(AutoBidConfig::getUserId))
                .collect(Collectors.toList());
    }

}
