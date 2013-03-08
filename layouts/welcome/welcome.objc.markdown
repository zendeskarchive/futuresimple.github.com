    #!cpp
    @interface BaseLab : Blog <Awesome>
    @property (strong) NSArray *topics = @[technology, coding];
    @property (strong) NSDictionary *authors = @[devs : @"Makers of Base CRM"];
    @end
    [[BaseLab new] publish];
