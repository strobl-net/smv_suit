#[macro_use]
extern crate diesel;

#[macro_use]
extern crate juniper;

pub mod config;
pub mod db;
pub mod endpoints;
// pub mod graphql;
pub mod models;
pub mod schema;

// Configure logger format to the following
// [YYYY-MM-DD][HH:mm:ss][library][type] message
// where library = name of the library
// and type = {info, error, trace, warn}
pub fn setup_logger() -> Result<(), fern::InitError> {
    fern::Dispatch::new()
        .format(|out, message, record| {
            out.finish(format_args!(
                "{}[{}][{}] {}",
                chrono::Local::now().format("[%Y-%m-%d][%H:%M:%S]"),
                record.target(),
                record.level(),
                message
            ))
        })
        .level(log::LevelFilter::Debug)
        .chain(std::io::stdout())
        .chain(fern::log_file("output.log")?)
        .apply()?;
    Ok(())
}
