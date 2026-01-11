CREATE TABLE symbols
(
    id         BIGSERIAL PRIMARY KEY,
    symbol     VARCHAR(20) NOT NULL UNIQUE,
    exchange   VARCHAR(50),
    name       VARCHAR(255),
    created_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_symbols_symbol ON symbols (symbol);

-- Daily candles table: Store OHLCV data
CREATE TABLE daily_candles
(
    id         BIGSERIAL PRIMARY KEY,
    symbol_id  BIGINT         NOT NULL REFERENCES symbols (id) ON DELETE CASCADE,
    date       DATE           NOT NULL,
    open       DECIMAL(20, 6) NOT NULL,
    high       DECIMAL(20, 6) NOT NULL,
    low        DECIMAL(20, 6) NOT NULL,
    close      DECIMAL(20, 6) NOT NULL,
    volume     BIGINT         NOT NULL,
    created_at TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (symbol_id, date)
);