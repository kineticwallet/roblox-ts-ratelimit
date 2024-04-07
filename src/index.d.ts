declare function Ratelimit<T extends unknown>(limit: number, interval: number): (key?: T) => boolean;
export = Ratelimit;
