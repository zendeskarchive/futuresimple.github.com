    #!objective-c
	@interface FutureSimpleLab : Blog <Awesome>
	@property (strong) NSArray *topics = @[technology, coding];
	@property (strong) NSDictionary *authors = @[devs : @"Makers of Base CRM and QuoteBase"];
	@end
	[[FutureSimpleLab new] publish];